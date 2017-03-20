class lldpd::install {
  package{'lldpd':
    ensure => $lldpd::ensure,
  }
}
