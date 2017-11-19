require 'puppetlabs_spec_helper/rake_tasks'

# load optional tasks for releases
# only available if gem group releases is installed
begin
  require 'puppet_blacksmith/rake_tasks'
  require 'voxpupuli/release/rake_tasks'
  require 'puppet-strings/tasks'
  require 'github_api'
rescue LoadError
end

PuppetLint.configuration.log_format = '%{path}:%{line}:%{check}:%{KIND}:%{message}'
PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.send('relative')
PuppetLint.configuration.send('disable_140chars')
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.send('disable_documentation')
PuppetLint.configuration.send('disable_single_quote_string_with_variables')

exclude_paths = %w(
  pkg/**/*
  vendor/**/*
  .vendor/**/*
  spec/**/*
)
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

desc 'Auto-correct puppet-lint offenses'
task 'lint:auto_correct' do
  PuppetLint.configuration.fix = true
  Rake::Task[:lint].invoke
end

desc 'Run acceptance tests'
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

desc 'Run tests metadata_lint, release_checks'
task test: [
  :metadata_lint,
  :release_checks,
]

desc "Run main 'test' task and report merged results to coveralls"
task test_with_coveralls: [:test] do
  if Dir.exist?(File.expand_path('../lib', __FILE__))
    require 'coveralls/rake/task'
    Coveralls::RakeTask.new
    Rake::Task['coveralls:push'].invoke
  else
    puts 'Skipping reporting to coveralls.  Module has no lib dir'
  end
end

desc "Print supported beaker sets"
task 'beaker_sets', [:directory] do |t, args|
  directory = args[:directory]

  metadata = JSON.load(File.read('metadata.json'))

  (metadata['operatingsystem_support'] || []).each do |os|
    (os['operatingsystemrelease'] || []).each do |release|
      if directory
        beaker_set = "#{directory}/#{os['operatingsystem'].downcase}-#{release}"
      else
        beaker_set = "#{os['operatingsystem'].downcase}-#{release}-x64"
      end

      filename = "spec/acceptance/nodesets/#{beaker_set}.yml"

      puts beaker_set if File.exists? filename
    end
  end
end

def reponame
  metadata_json = File.join(File.dirname(__FILE__), 'metadata.json')
  metadata = JSON.load(File.read(metadata_json))
  metadata['name']
end
begin
  require 'github_changelog_generator/task'
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    version = (Blacksmith::Modulefile.new).version
    config.future_release = "v#{version}" if version =~ /^\d+\.\d+.\d+$/
    config.header = "# Changelog\n\nAll notable changes to this project will be documented in this file.\nEach new release typically also includes the latest modulesync defaults.\nThese should not affect the functionality of the module."
    config.exclude_labels = %w{duplicate question invalid wontfix wont-fix modulesync skip-changelog}
    config.user = 'voxpupuli'
    config.project = reponame
  end
rescue LoadError
end

desc "Create a github release"
task 'github_release' do
  (puts "you need to provide a GitHub OAuth Token as environment variabe GITHUB_OAUTH"; exit) unless ENV['GITHUB_OAUTH']
  github = Github.new oauth_token: ENV['GITHUB_OAUTH']
  release = {
    owner: 'voxpupuli',
    repo: reponame,
    tag_name: metadata['version'],
    name: changelog[subsections[0]].match(/^## \d+-\d+-\d+ - (?<name>.*)$/)[:name],
    body: changelog[subsections[0]..subsections[1] - 2].join("\n"),
    draft: false,
    prerelease: false
  }

  response = github.repos.releases.create release
  # create gpg sig for the module
  # 'gpg', '--sign', '--detach-sign', '--armor' pkg/something

  # itereate on github.repos.releases.assets.upload
  ["#{reponame}-#{metadata['version']}-tar.gz", "#{reponame}-#{metadata['version']}-tar.gz.asc"].each do |filename|
    asset = {
      owner: 'voxpupuli',
      repo: reponame,
      id: response['id'],
      name: filename,
      filepath: "pkg/#{filename}",
      content_type: 'application/gzip'
    }

    github.repos.releases.assets.upload asset
  end
end

# vim: syntax=ruby
