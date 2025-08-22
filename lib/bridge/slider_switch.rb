# frozen_string_literal: true

require_relative "switch"
class SliderSwitch < Switch
  def slider_down(by:)
    @device.adjust_output_level(@device.output_level - by)
  end

  def slider_up(by:)
    @device.adjust_output_level(@device.output_level + by)
  end
end
