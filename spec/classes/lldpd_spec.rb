require 'spec_helper'

describe 'lldpd' do
  let :node do
    'agent.example.com'
  end

  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      context 'with all defaults' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('lldpd') }
        it { is_expected.to contain_class('lldpd::config') }
        it { is_expected.to contain_class('lldpd::service') }
        it { is_expected.to contain_class('lldpd::install') }
        it { is_expected.to contain_class('lldpd::repo') }
        it { is_expected.to contain_service('lldpd') }
        it { is_expected.to contain_package('lldpd') }

        context 'it creates a cronjob/systemdtimer' do
          systemd_fact = case facts[:os]['family']
                         when 'Archlinux'
                           { systemd: true }
                         when 'RedHat'
                           facts[:os]['release']['major'].to_i >= 7 ? { systemd: true } : { systemd: false }
                         else
                           { systemd: false }
                         end
          facts.merge!(systemd_fact)
          it { is_expected.to contain_file('/usr/local/bin/lldp2facts') }
          if facts[:systemd] == true
            it { is_expected.to contain_service('lldp2facts.timer') }
            it { is_expected.to contain_systemd__unit_file('lldp2facts.service') }
            it { is_expected.to contain_systemd__unit_file('lldp2facts.timer') }
          else
            it { is_expected.to contain_file('/etc/cron.d/lldp2facts') }
          end
        end

        context 'it manages repos' do
          case facts[:os]['family']
          when 'RedHat'
            it { is_expected.to contain_yumrepo('lldpd') }
          end
        end

        unless %w[RedHat CentOS].include?(facts[:os]['name'])
          context 'it manages jq' do
            it { is_expected.to contain_package('jq') }
          end
        end
      end
    end
  end
end
