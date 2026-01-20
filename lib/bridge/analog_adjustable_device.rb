# frozen_string_literal: true

require_relative "device"
class AnalogAdjustableDevice < Device
  attr_reader :output_level

  def initialize
    super
    @output_level = 100
  end

  def output_level_down(by:)
    @output_level -= by
  end

  def output_level_up(by:)
    @output_level += by
  end
end
