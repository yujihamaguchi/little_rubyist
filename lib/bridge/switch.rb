# frozen_string_literal: true

class Switch
  def initialize(device:)
    @device = device
  end

  def turn_on
    @device.power_on
  end

  def turn_off
    @device.power_off
  end
end
