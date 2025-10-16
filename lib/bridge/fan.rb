# frozen_string_literal: true

require_relative "device"
require_relative "tri_level_adjustable"
require_relative "slider_adjustable"
class Fan < Device
  include TriLevelAdjustable
  include SliderAdjustable
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
