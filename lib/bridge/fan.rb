# frozen_string_literal: true

require_relative "device"
require_relative "tri_multi_level_adjustable"
class Fan < Device
  include TriMultiLevelAdjustable
  def adjust_output_low_level
    self.adjust_output_level(20)
  end

  def adjust_output_medium_level
    self.adjust_output_level(50)
  end

  def adjust_output_high_level
    self.adjust_output_level(100)
  end

  def speed
    return :low if self.output_level <= 33
    return :medium if self.output_level <= 66

    :high
  end
end
