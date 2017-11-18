# entry class for lldpd
class lldpd (
  Boolean $manage_facts,
  Boolean $manage_service,
  Boolean $manage_repo,
  Boolean $manage_jq,
  Optional[String] $repourl,
  Enum['present', 'absent', 'latest'] $ensure,
) {

  contain ::lldpd::repo
  contain ::lldpd::install
  contain ::lldpd::config
  contain ::lldpd::service

  Class['lldpd::repo']
  -> Class['lldpd::install']
  -> Class['lldpd::config']
  ~> Class['lldpd::service']
}
