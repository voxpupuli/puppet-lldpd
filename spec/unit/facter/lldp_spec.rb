# frozen_string_literal: true

require 'spec_helper'
command_output1 = <<~STDOUT1
  {
    "lldp": {
      "interface": [
        {
          "eno1": {
            "via": "LLDP",
            "rid": "1",
            "age": "6 days, 08:09:50",
            "chassis": {
              "router": {
                "id": {
                  "type": "mac",
                  "value": "10:0e:7e:aa:aa:aa"
                },
                "descr": "example router",
                "mgmt-ip": "192.0.2.1",
                "capability": [
                  {
                    "type": "Bridge",
                    "enabled": true
                  },
                  {
                    "type": "Router",
                    "enabled": true
                  }
                ]
              }
            },
            "port": {
              "id": {
                "type": "ifname",
                "value": "ge-1/0/1"
              },
              "descr": "host:eno1 {#}",
              "ttl": "120",
              "mfs": "9192",
              "auto-negotiation": {
                "supported": true,
                "enabled": true,
                "advertised": {
                  "type": "1000Base-T",
                  "hd": false,
                  "fd": true
                },
                "current": "unknown"
              }
            },
            "vlan": {
              "vlan-id": "42",
              "pvid": true,
              "value": "vlan-42"
            },
            "lldp-med": {
              "device-type": "Network Connectivity Device",
              "capability": [
                {
                  "type": "Capabilities",
                  "available": true
                },
                {
                  "type": "Policy",
                  "available": true
                },
                {
                  "type": "Location",
                  "available": true
                },
                {
                  "type": "MDI/PSE",
                  "available": true
                }
              ]
            }
          }
        }
      ]
    }
  }
STDOUT1
command_output2 = <<~STDOUT2
  {
    "lldp": {
      "interface": {
        "enp3s0": {
          "via": "LLDP",
          "rid": "1",
          "age": "0 day, 01:01:52",
          "chassis": {
            "id": {
              "type": "mac",
              "value": "44:94:fc:9d:55:0a"
            },
            "mgmt-ip": "192.168.178.21",
            "mgmt-iface": "51"
          },
          "port": {
            "id": {
              "type": "local",
              "value": "g17"
            },
            "ttl": "120"
          }
        }
      }
    }
  }

STDOUT2
command_output3 = <<~STDOUT3
  {
    "lldp": {

    }
  }

STDOUT3
fact_result1 = {
  'interfaces' => {
    'eno1' => {
      'age' => '6 days, 08:09:50',
      'chassis' => {
        'router' => {
          'capability' => [
            { 'enabled' => true, 'type' => 'Bridge' },
            { 'enabled' => true, 'type' => 'Router' }
          ],
          'descr' => 'example router',
          'id' => { 'type' => 'mac', 'value' => '10:0e:7e:aa:aa:aa' }, 'mgmt-ip' => '192.0.2.1'
        }
      },
      'lldp-med' => {
        'capability' => [
          { 'available' => true, 'type' => 'Capabilities' },
          { 'available' => true, 'type' => 'Policy' },
          { 'available' => true, 'type' => 'Location' },
          { 'available' => true, 'type' => 'MDI/PSE' }
        ],
        'device-type' => 'Network Connectivity Device'
      },
      'port' => {
        'auto-negotiation' => {
          'advertised' => {
            'fd' => true,
            'hd' => false,
            'type' => '1000Base-T'
          },
          'current' => 'unknown',
          'enabled' => true,
          'supported' => true
        },
        'descr' => 'host:eno1 {#}',
        'id' => {
          'type' => 'ifname',
          'value' => 'ge-1/0/1'
        },
        'mfs' => '9192',
        'ttl' => '120'
      },
      'rid' => '1',
      'via' => 'LLDP',
      'vlan' =>
      { 'pvid' => true, 'value' => 'vlan-42', 'vlan-id' => '42' }
    }
  }
}
# to create it:
#   require 'json'
#   value = `lldpctl -f json`
#   puts JSON.parse(value)
fact_result2 = { 'interfaces' => { 'enp3s0' => { 'via' => 'LLDP', 'rid' => '1', 'age' => '0 day, 01:01:52', 'chassis' => { 'id' => { 'type' => 'mac', 'value' => '44:94:fc:9d:55:0a' }, 'mgmt-ip' => '192.168.178.21', 'mgmt-iface' => '51' }, 'port' => { 'id' => { 'type' => 'local', 'value' => 'g17' }, 'ttl' => '120' } } } }
fact_result3 = { 'interfaces' => {} }

describe Facter::Util::Fact.to_s do
  before { Facter.clear }

  context 'lldpctl not in path' do
    before do
      allow(Facter::Util::Resolution).to receive(:which).with('lldpctl').and_return(nil)
    end

    it { expect(Facter.fact(:lldp).value).to eq(nil) }
  end

  context 'valid run' do
    before do
      allow(Facter::Util::Resolution).to receive(:which).with('lldpctl').and_return('/usr/sbin/lldpctl')
    end

    context 'lldp multiple interfaces' do
      before do
        allow(Facter::Util::Resolution).to receive(:exec).with('lldpctl -f json') { command_output1 }
      end

      it { expect(Facter.fact(:lldp).value).to eq fact_result1 }
    end

    context 'valid single interface' do  # https://github.com/voxpupuli/puppet-lldpd/issues/129
      before do
        allow(Facter::Util::Resolution).to receive(:exec).with('lldpctl -f json') { command_output2 }
      end

      it { expect(Facter.fact(:lldp).value).to eq fact_result2 }
    end

    context 'no interface' do
      before do
        allow(Facter::Util::Resolution).to receive(:exec).with('lldpctl -f json') { command_output3 }
      end

      it { expect(Facter.fact(:lldp).value).to eq fact_result3 }
    end
  end
end
