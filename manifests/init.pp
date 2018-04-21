# lldpd
#
# @summary A module to manage lldpd and related facts
#
# @example Basic usage
#   include lldpd
#
# @param manage_facts Enable or disable the fact deployment. Doesn't work on FreeBSD yet
# @param manage_service Enable or disable the service management
# @param manage_repo Enable or disable the repository setup
# @param manage_jq Enable or disable the installation of jq (doesn't manage maybe needed third-part repositories like EPEL)
# @param repourl String that completes the url for the upstream repository
# @param ensure Install or deinstall all related components
class lldpd (
  Boolean $manage_facts,
  Boolean $manage_service,
  Boolean $manage_repo,
  Boolean $manage_jq,
  Optional[String] $repourl,
  Enum['present', 'absent', 'latest'] $ensure,
) {

  contain lldpd::repo
  contain lldpd::install
  contain lldpd::service

  Class['lldpd::repo']
  -> Class['lldpd::install']
  ~> Class['lldpd::service']
}
