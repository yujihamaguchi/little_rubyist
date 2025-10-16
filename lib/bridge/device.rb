# frozen_string_literal: true

class Device
  attr_reader :output_level

  def initialize
    @power_on = false
    @output_level = 100
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
