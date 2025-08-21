# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/light"
require_relative "../../lib/bridge/fan"
require_relative "../../lib/bridge/dimmer_switch"

class DimmerSwitchE2eTest < Minitest::Test
  DEVICE_CLASSES = [Light, Fan].freeze

  def test_dim_device
    DEVICE_CLASSES.each do |device_class|
      # Arrange
      device = device_class.new
      switch = DimmerSwitch.new(device: device)
      switch.turn_on
      assert 100, device.output_level

      # Act
      switch.dim(by: 20)

      # Assert
      assert 80, device.output_level
    end
  end

  def test_brighten_device
    DEVICE_CLASSES.each do |device_class|
      # Arrange
      device = device_class.new
      switch = DimmerSwitch.new(device: device)
      switch.turn_on
      switch.dim(by: 30)
      assert 70, device.output_level

      # Act
      switch.brighten(by: 20)

      # Assert
      assert 90, device.output_level
    end
  end
end
