if $facts['os']['family'] == 'Debian' {
  package { ['apt-transport-https', 'lsb-release']:
    ensure => 'installed',
  }
}
