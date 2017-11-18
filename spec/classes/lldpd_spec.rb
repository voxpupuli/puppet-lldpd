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
        it { is_expected.to contain_package('jq') }

        context 'it creates a cronjob/systemdtimer' do
          it { is_expected.to contain_file('/etc/cron.d/lldp2facts') }
          it { is_expected.to contain_file('/usr/local/bin/lldp2facts') }
        end

        context 'it manages repos' do
          case facts[:os]['family']
          when 'RedHat'
            it { is_expected.to contain_yumrepo('lldpd') }
          end
        end
      end
    end
  end
end
