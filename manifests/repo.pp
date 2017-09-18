class lldpd::repo {
  if $lldpd::manage_repo {
    if $facts['osfamily'] == 'RedHat' {
      case $facts['operatingsystemmajrelease'] {
        '7': {
          base::yumrepo{'lldpd':
            ensure  => 'present',
            descr   => 'lldpd toolset',
            gpgkey  => 'http://download.opensuse.org/repositories/home:/vbernat/CentOS_7/repodata/repomd.xml.key',
            baseurl => 'http://download.opensuse.org/repositories/home:/vbernat/CentOS_7/'
          }
        }
        # PSBM is a piece of crap and calls itself '2' as major release
        '2', '6': {
          base::yumrepo{'lldpd':
            ensure  => 'present',
            descr   => 'lldpd toolset',
            gpgkey  => 'http://download.opensuse.org/repositories/home:/vbernat/CentOS_CentOS-6/repodata/repomd.xml.key',
            baseurl => 'http://download.opensuse.org/repositories/home:/vbernat/CentOS_CentOS-6/'
          }
        }
        '25': {
          base::yumrepo{'lldpd':
            ensure  => 'present',
            descr   => 'lldpd toolset',
            gpgkey  => 'http://download.opensuse.org/repositories/home:/vbernat/Fedora_25/repodata/repomd.xml.key',
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
