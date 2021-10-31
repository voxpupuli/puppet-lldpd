# frozen_string_literal: true

require 'spec_helper'

describe 'lldpd' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
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
        it { is_expected.to contain_service('lldpd') }
        it { is_expected.to contain_package('lldpd') }

        if facts[:os]['family'] == 'RedHat' && facts[:os]['release']['major'].to_i < 27
          it { is_expected.to contain_yumrepo('lldpd') }
        else
          it { is_expected.not_to contain_yumrepo('lldpd') }
        end

        if facts[:os]['family'] == 'Debian' && facts[:os]['release']['full'] != '18.04'
          it { is_expected.to contain_apt__source('lldpd') }
        else
          it { is_expected.not_to contain_apt__source('lldpd') }
        end
      end
    end
  end
end
