require 'spec_helper'

describe 'lldpd' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      context 'with all defaults' do
        systemd = case facts[:os]['family']
                  when 'Archlinux'
                    true
                  when 'RedHat'
                    facts[:os]['release']['major'].to_i >= 7
                  else
                    false
                  end
        facts[:systemd] = systemd

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('lldpd') }
        it { is_expected.to contain_class('lldpd::config') }
        it { is_expected.to contain_class('lldpd::service') }
        it { is_expected.to contain_class('lldpd::install') }
        it { is_expected.to contain_class('lldpd::repo') }
        it { is_expected.to contain_service('lldpd') }
        it { is_expected.to contain_package('lldpd') }
        it { is_expected.to contain_file('/usr/local/bin/lldp2facts') }

        if facts[:systemd]
          it { is_expected.to contain_service('lldp2facts.timer') }
          it { is_expected.to contain_systemd__unit_file('lldp2facts.service') }
          it { is_expected.to contain_systemd__unit_file('lldp2facts.timer') }
        else
          it { is_expected.to contain_file('/etc/cron.d/lldp2facts') }
        end

        if facts[:os]['family'] == 'RedHat'
          it { is_expected.to contain_yumrepo('lldpd') }
        else
          it { is_expected.not_to contain_yumrepo('lldpd') }
        end

        if facts[:os]['family'] == 'Debian'
          it { is_expected.to contain_apt__source('lldpd') }
        else
          it { is_expected.not_to contain_apt__source('lldpd') }
        end

        if facts[:os]['name'] == 'CentOS'
          it { is_expected.not_to contain_package('jq') }
        else
          it { is_expected.to contain_package('jq') }
        end
      end
    end
  end
end
