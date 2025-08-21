# frozen_string_literal: true

require_relative "switch"
class DimmerSwitch < Switch
  def dim(by:)
    @device.adjust_output_level(@device.output_level - by)
  end

  def brighten(by:)
    @device.adjust_output_level(@device.output_level + by)
  end
end
