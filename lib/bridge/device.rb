# frozen_string_literal: true

class Device
  def initialize
    @power_on = false
  end

  def power_on?
    @power_on
  end

  def power_on
    @power_on = true
  end

  def power_off
    @power_on = false
  end
end
