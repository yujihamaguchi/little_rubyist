# frozen_string_literal: true

require_relative "analog_adjustable_device"
require_relative "tri_level_adjustable"
class Fan < AnalogAdjustableDevice
  include TriLevelAdjustable
  attr_reader :speed

  def initialize
    super
    @speed = :medium
  end

  def low
    @speed = :low
  end

  def medium
    @speed = :medium
  end

  def high
    @speed = :high
  end
end
