# frozen_string_literal: true

require_relative "switch"
class TriLevelSwitch < Switch
  def low
    @device.adjust_output_low_level
  end

  def medium
    @device.adjust_output_medium_level
  end

  def high
    @device.adjust_output_high_level
  end
end
