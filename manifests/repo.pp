class lldpd::repo {
  if $lldpd::manage_repo {
    if $facts['osfamily'] == 'RedHat' {
      case $facts['operatingsystemmajreleas'] {
        '7': {
          base::yumrepo{'lldpd':
            ensure  => 'present',
            descr   => 'lldpd toolset',
            gpgkey  => 'http://fabric-mirror.vps.hosteurope.de/lldpd/gpgkey_centos7.key',
            baseurl => 'http://download.opensuse.org/repositories/home:/vbernat/CentOS_7/'
          }
        }
        '6': {
          base::yumrepo{'lldpd':
            ensure  => 'present',
            descr   => 'lldpd toolset',
            gpgkey  => 'http://fabric-mirror.vps.hosteurope.de/lldpd/gpgkey_centos6.key',
            baseurl => 'http://download.opensuse.org/repositories/home:/vbernat/CentOS_CentOS-6/'
          }
        }
        '25': {
          base::yumrepo{'lldpd':
            ensure  => 'present',
            descr   => 'lldpd toolset',
            gpgkey  => 'http://fabric-mirror.vps.hosteurope.de/lldpd/gpgkey_fedora25.key',
            baseurl => 'http://download.opensuse.org/repositories/home:/vbernat/Fedora_25/'
          }
        }
        '24': {
          base::yumrepo{'lldpd':
            ensure  => 'present',
            descr   => 'lldpd toolset',
            gpgkey  => 'http://fabric-mirror.vps.hosteurope.de/lldpd/gpgkey_fedora24.key',
            baseurl => 'http://download.opensuse.org/repositories/home:/vbernat/Fedora_24/'
          }
        }
        default: {}
      }
    }
  }
}
