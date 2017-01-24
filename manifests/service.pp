class lldpd::service {
  if $lldpd::manage_service {
    service{'lldpd':
      ensure => 'running',
      enable => true,
    }
  }
  if $lldpd::manage_facts {
    package{'jq':
      ensure => 'present',
    }
    file{'/usr/local/bin/lldp2facts':
      ensure => 'file',
      mode   => '0755',
      source => "puppet:///modules/${module_name}/lldp2facts",
    }
    file{'/usr/local/bin/lldp2ctl':
      ensure =>  'absent',
    }
    if $facts['systemd'] {
      ::systemd::unit_file{'lldp2facts.service':
        source => "puppet:///modules/${module_name}/lldp2facts.service",
      }
      ::systemd::unit_file{'lldp2facts.timer':
        source => "puppet:///modules/${module_name}/lldp2facts.timer",
      }
      service{'lldp2facts.timer':
        ensure => 'running',
        enable => true,
      }
    } else {
      file{'/etc/cron.d/lldp2facts':
        ensure => 'file',
        source => "puppet:///modules/${module_name}/lldp2facts.cron",
      }
    }
  }
}
