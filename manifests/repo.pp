class lldpd::repo {
  if $lldpd::manage_repo {
    case $facts['os']['family'] {
      'RedHat': {
        yumrepo{'lldpd':
          ensure  => 'present',
          descr   => 'lldpd toolset',
          gpgkey  => "https://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}/repodata/repomd.xml.key",
          baseurl => "https://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}/",
        }
      }
      'Debian': {
        apt::source{'lldpd':
          location => "http://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}",
          release  => ' ',
          repos    => '/',
          key      => {
            id     => '4B90925372E0A4F6',
            source => "http://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}/Release.key",
          },
        }
      }
      default: {}
    }
  }
}
