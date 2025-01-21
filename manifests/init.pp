# lldpd
#
# @summary A module to manage lldpd and related facts
#
# @example Basic usage
#   include lldpd
#
# @param ensure Install or deinstall all related components
# @param manage_service Enable or disable the service management
# @param manage_repo Enable or disable the repository setup
# @param repourl String that completes the url for the upstream repository
# @param apt_key the public key used to sign the apt repository (default loaded from hiera)
class lldpd (
  Enum['present', 'absent', 'latest'] $ensure            = 'present',
  Boolean                             $manage_repo       = false,
  Boolean                             $manage_service    = true,
  Optional[String[1]]                 $repourl           = undef,
  Optional[String[1]]                 $apt_key           = undef,
) {
  if $manage_repo {
    case $facts['os']['family'] {
      'RedHat': {
        yumrepo { 'lldpd':
          ensure   => 'present',
          descr    => 'lldpd toolset',
          gpgkey   => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}/repodata/repomd.xml.key",
          baseurl  => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}/",
          gpgcheck => 1,
        }
      }
      'Debian': {
        include apt # required so apt::key can access variables from init.pp

        # Get rid of all the different old keys
        file { [
            '/etc/apt/trusted.gpg.d/home_vbernat.gpg',
            '/etc/apt/trusted.gpg.d/home_vbernat.gpg~',
            '/usr/share/keyrings/lldpd.asc',
          ]:
            ensure => absent,
        }
        apt::key { 'EF795E4D26E48F1D7661267B431C37A97C3E114B':
          ensure => 'absent',
        }

        # Configure source and key
        apt::source { 'lldpd':
          location => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}",
          release  => ' ',
          repos    => '/',
          key      => {
            name    => 'lldpd',
            content => $apt_key,
          },
          require  => File['/usr/share/keyrings/lldpd.asc'],
        }
        Apt::Source['lldpd'] -> Package['lldpd']
      }
      default: {
        warning("`\$manage_repo` not valid for: ${facts['os']['family']}")
      }
    }
  }

  package { 'lldpd':
    ensure => $ensure,
  }

  if $manage_service {
    service { 'lldpd':
      ensure  => 'running',
      enable  => true,
      require => Package['lldpd'],
    }
  }
}
