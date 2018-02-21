# lldpd::service
#
# @api private
#
# @summary Manages the lldpd service + facts
#
class lldpd::service {

  assert_private()

  if $lldpd::manage_service {
    service{'lldpd':
      ensure => 'running',
      enable => true,
    }
  }
  if $lldpd::manage_facts {
    if $lldpd::manage_jq {
      ensure_packages(['jq'], { 'ensure' => 'present'})
    }
    file{'/usr/local/bin/lldp2facts':
      ensure => 'file',
      mode   => '0755',
      source => "puppet:///modules/${module_name}/lldp2facts",
    }
    if $facts['systemd'] {
      ::systemd::unit_file{'lldp2facts.service':
        source => "puppet:///modules/${module_name}/lldp2facts.service",
      }
      -> ::systemd::unit_file{'lldp2facts.timer':
        source => "puppet:///modules/${module_name}/lldp2facts.timer",
      }
      -> service{'lldp2facts.timer':
        ensure => 'running',
        enable => true,
      }
      # ensure that we don't deploy a cronjob on FreeBSD
    } elsif $facts['kernel'] == 'Linux'{
      file{'/etc/cron.d/lldp2facts':
        ensure => 'file',
        source => "puppet:///modules/${module_name}/lldp2facts.cron",
      }
    }
  }
}
