# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/light"
require_relative "../../lib/bridge/fan"
require_relative "../../lib/bridge/switch"

# クライアントに提供したいインタフェースとその操作対象の組み合わせ爆発を防ぎ、両者を相互に依存させずに独立して拡張できるようにしたい。ｔ

DEVICE_CLASSES = [
  Light, Fan
].freeze

class SwitchE2eTest < Minitest::Test
  def test_turn_on_device
    DEVICE_CLASSES.each do |device_class|
      # Arrange
      device = device_class.new
      refute device.power_on?
      switch = Switch.new(device: device)

      # Act
      switch.turn_on

      # Assert
      assert device.power_on?
    end
  end

  def test_turn_off_device
    DEVICE_CLASSES.each do |device_class|
      # Arrange
      device = device_class.new
      switch = Switch.new(device: device)
      switch.turn_on
      assert device.power_on?

      # Act
      switch.turn_off

      # Assert
      refute device.power_on?
    end
  end
end
