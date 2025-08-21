# frozen_string_literal: true

class Device
  attr_reader :output_level

  def initialize
    @power_on = false
    @output_level = 100
  end

  def power_off
    @power_on = false
  end

  def power_on
    @power_on = true
  end

  def power_on?
    @power_on
  end

  def adjust_output_level(percentage)
    @output_level = percentage
  end

  def adjust_output_low_level
    raise NotImplementedError
  end

  def adjust_output_medium_level
    raise NotImplementedError
  end

  def adjust_output_high_level
    raise NotImplementedError
  end
end
