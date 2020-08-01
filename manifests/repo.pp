# lldpd::repo
#
# @api private
#
# @summary Manages the yum or apt repositories
#
class lldpd::repo {
  assert_private()

  if $lldpd::manage_repo {
    case $facts['os']['family'] {
      'RedHat': {
        yumrepo { 'lldpd':
          ensure  => 'present',
          descr   => 'lldpd toolset',
          gpgkey  => "https://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}/repodata/repomd.xml.key",
          baseurl => "https://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}/",
        }
      }
      'Debian': {
        apt::source { 'lldpd':
          location => "http://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}",
          release  => ' ',
          repos    => '/',
          key      => {
            id     => $lldpd::gpgkeyfingerprint,
            source => "http://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}/Release.key",
          },
        }
      }
      default: {}
    }
  }
}
