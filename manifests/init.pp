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
          ensure   => 'present',
          descr    => 'lldpd toolset',
          gpgkey   => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}/repodata/repomd.xml.key",
          baseurl  => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}/",
          gpgcheck => 1,
          before   => Package['lldpd'],
        }
      }
      'Debian': {
        if ! $gpgkeyfingerprint {
          fail('you must specify a `$gpgkeyfingerprint` when using `$manage_repo` on debian')
        }
        # place the key in the keyrings directory where apt won't search for keys for all repos
        # ascii encoded files need to end with *.asc, binary files with .gpg...
        file { '/usr/share/keyrings/lldpd.asc':
          source         => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}/Release.key",
          owner          => 'root',
          group          => 'root',
          mode           => '0644',
          checksum_value => '2e532e3f800b788b0248da86b1cd722e58e9c99413912fd029c20d88d55ebadc',
          checksum       => 'sha256',
        }
        # purge old key files that we installed in previous releases
        file { ['/etc/apt/trusted.gpg.d/home_vbernat.gpg', '/etc/apt/trusted.gpg.d/home_vbernat.gpg~']:
          ensure => absent,
        }

        # previously managed by apt::key, we need to purge it from the global keyring in /etc/apt/trusted.gpg
        include apt # required so apt::key can access variables from init.pp
        apt::key { 'EF795E4D26E48F1D7661267B431C37A97C3E114B':
          ensure => 'absent',
        }
        apt::source { 'lldpd':
          location => "https://download.opensuse.org/repositories/home:/vbernat/${repourl}",
          release  => ' ',
          repos    => '/',
          keyring  => '/usr/share/keyrings/lldpd.asc',
          before   => [Package['lldpd'], File['/usr/share/keyrings/lldpd.asc'],],
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
      ensure  => 'running',
      enable  => true,
      require => Package['lldpd'],
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
