# frozen_string_literal: true

require 'facter'
require 'json'

Facter.add(:lldp) do
  confine do
    Facter::Util::Resolution.which('lldpctl')
  end

  setcode do
    data = Facter::Util::Resolution.exec('lldpctl -f json')
    json = JSON.parse(data)
    json['lldp']
  rescue StandardError => e
    Facter.warn("Failed to parse lldpctl -f json: #{e.class}: #{e}")
    Facter.debug(e.backtrace.join("\n\t"))
  end
end
