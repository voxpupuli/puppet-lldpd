# entry class for lldpd
class lldpd (
  Boolean $manage_facts = true,
  Boolean $manage_service = true,
  Boolean $manage_repo = true,
) {

  contain ::lldpd::repo
  contain ::lldpd::install
  contain ::lldpd::config
  contain ::lldpd::service

  Class['lldpd::repo'] ->
  Class['lldpd::install'] ->
  Class['lldpd::config'] ~>
  Class['lldpd::service']
}
