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
# @param gpgkeyfingerprint String with the ID from the gpg key that signed the packages
class lldpd (
  Enum['present', 'absent', 'latest'] $ensure            = 'present',
  Boolean                             $manage_repo       = false,
  Boolean                             $manage_service    = true,
  Optional[String[1]]                 $repourl           = undef,
  Optional[String[40]]                $gpgkeyfingerprint = undef,
) {
  if $manage_repo {
    case $facts['os']['family'] {
      'RedHat': {
        yumrepo { 'lldpd':
          ensure  => 'present',
          descr   => 'lldpd toolset',
          gpgkey  => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}/repodata/repomd.xml.key",
          baseurl => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}/",
        }
      }
      'Debian': {
        if ! $gpgkeyfingerprint {
          fail('you must specify a `$gpgkeyfingerprint` when using `$manage_repo` on debian')
        }
        apt::source { 'lldpd':
          location => "http://download.opensuse.org/repositories/home:/vbernat/${repourl}",
          release  => ' ',
          repos    => '/',
          key      => {
            id     => $gpgkeyfingerprint,
            source => "http://download.opensuse.org/repositories/home:/vbernat/${repourl}/Release.key",
          },
        }
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
      ensure => 'running',
      enable => true,
    }
  }
  # TODO: remove this at some point...
  # clean resources used by version < 3.0.0
  file { ['/usr/local/bin/lldp2facts', '/etc/cron.d/lldp2facts']:
    ensure => absent,
  }
  systemd::unit_file { ['lldp2facts.service', 'lldp2facts.timer']:
    ensure => absent,
  }
}
