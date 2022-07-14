# frozen_string_literal: true

require 'facter'
require 'json'

class MalformedDataError < StandardError; end

Facter.add(:lldp) do
  confine do
    Facter::Util::Resolution.which('lldpctl')
  end

  setcode do
    fact_data = {}
    begin
      data = Facter::Util::Resolution.exec('lldpctl -f json')
      json = JSON.parse(data).fetch('lldp', {}).fetch('interface', [])
      raise MalformedDataError, 'no lldp interface data found' if json.empty?

      fact_data['interfaces'] = {}
      # if lldp detects only a single interface, we get a hash with data for that interface
      # for multiple interfaces we get an array with one hash
      if json.instance_of?(Hash)
        fact_data['interfaces'] = json
      else
        json.each do |iface_h|
          ifaces = iface_h.keys
          raise MalformedDataError, 'expected exactly one key per interface object' unless ifaces.size == 1

          iface = ifaces.first
          fact_data['interfaces'][iface] = iface_h[iface]
        end
      end
    rescue MalformedDataError => e
      Facter.warn("invalid or malformed lldp data: #{e.class}: #{e}")
      Facter.debug(e.backtrace.join("\n\t"))
      fact_data = nil
    rescue StandardError => e
      Facter.warn("Failed to parse lldpctl -f json: #{e.class}: #{e}")
      Facter.debug(e.backtrace.join("\n\t"))
      fact_data = nil
    end
    fact_data
  end
end
