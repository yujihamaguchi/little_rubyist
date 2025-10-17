# frozen_string_literal: true

require_relative "device"
require_relative "slider_adjustable"
class SliderAdjustableDevice < Device
  include SliderAdjustable
  attr_reader :output_level

  def initialize
    super
    @output_level = 100
  end
end
