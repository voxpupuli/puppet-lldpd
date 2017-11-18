class lldpd::repo {
  if $lldpd::manage_repo {
    yumrepo{'lldpd':
      ensure  => 'present',
      descr   => 'lldpd toolset',
      gpgkey  => "http://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}/repodata/repomd.xml.key",
      baseurl => "http://download.opensuse.org/repositories/home:/vbernat/${lldpd::repourl}/",
    }
  }
}
