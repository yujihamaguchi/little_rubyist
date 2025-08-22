# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/light"
require_relative "../../lib/bridge/fan"
require_relative "../../lib/bridge/record_player"
require_relative "../../lib/bridge/slider_switch"

class SliderSwitchE2eTest < Minitest::Test
  DEVICE_CLASSES = [Light, Fan, RecordPlayer].freeze

  def test_slider_down_device
    DEVICE_CLASSES.each do |device_class|
      # Arrange
      device = device_class.new
      switch = SliderSwitch.new(device: device)
      switch.turn_on
      assert 100, device.output_level

      # Act
      switch.slider_down(by: 20)

      # Assert
      assert 80, device.output_level
    end
  end

  def test_slider_up_device
    DEVICE_CLASSES.each do |device_class|
      # Arrange
      device = device_class.new
      switch = SliderSwitch.new(device: device)
      switch.turn_on
      switch.slider_down(by: 30)
      assert 70, device.output_level

      # Act
      switch.slider_up(by: 20)

      # Assert
      assert 90, device.output_level
    end
  end
end
