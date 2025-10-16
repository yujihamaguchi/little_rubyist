# frozen_string_literal: true

require_relative "switch"
class SliderSwitch < Switch
  def slider_down(by:)
    @device.slider_down(by: by)
  end

  def slider_up(by:)
    @device.slider_up(by: by)
  end
end
