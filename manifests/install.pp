# lldpd::install
#
# @api private
#
# @summary Manages the lldpd package
#
class lldpd::install {
  assert_private()

  package { 'lldpd':
    ensure => $lldpd::ensure,
  }
}
