# frozen_string_literal: true

require_relative "device"
class Light < Device
  def adjust_output_low_level
    self.adjust_output_level(10)
  end

  def adjust_output_medium_level
    self.adjust_output_level(50)
  end

  def adjust_output_high_level
    self.adjust_output_level(100)
  end

  def brightness
    return :dim if self.output_level <= 10
    return :medium if self.output_level <= 80

    :bright
  end
end
