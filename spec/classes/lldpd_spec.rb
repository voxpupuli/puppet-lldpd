# frozen_string_literal: true

require 'spec_helper'

describe 'lldpd' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts.merge({ systemd: true })
      end

      context 'with all defaults' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('lldpd') }
        it { is_expected.to contain_service('lldpd').that_requires('Package[lldpd]') }
        it { is_expected.to contain_package('lldpd') }

        if facts[:os]['family'] == 'RedHat' && facts[:os]['release']['major'].to_i < 9
          it { is_expected.to contain_yumrepo('lldpd') }
        else
          it { is_expected.not_to contain_yumrepo('lldpd') }
        end

        if facts[:os]['family'] == 'Debian' && facts[:os]['release']['full'] != '18.04'
          it { is_expected.to contain_apt__source('lldpd') }
          it { is_expected.to contain_apt__key('EF795E4D26E48F1D7661267B431C37A97C3E114B').with_ensure('absent') }
          it { is_expected.to contain_file('/usr/share/keyrings/lldpd.asc') }
          it { is_expected.to contain_file('/etc/apt/trusted.gpg.d/home_vbernat.gpg').with_ensure('absent') }
          it { is_expected.to contain_file('/etc/apt/trusted.gpg.d/home_vbernat.gpg~').with_ensure('absent') }
        else
          it { is_expected.not_to contain_apt__source('lldpd') }
          it { is_expected.not_to contain_apt__key('EF795E4D26E48F1D7661267B431C37A97C3E114B') }
        end
      end
    end
  end
end
