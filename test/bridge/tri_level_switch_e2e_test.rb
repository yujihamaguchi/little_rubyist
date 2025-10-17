# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/light"
require_relative "../../lib/bridge/fan"
require_relative "../../lib/bridge/tri_level_switch"

class TriLevelSwitchE2eTest < Minitest::Test
  LIGHT_TEST_CASES = [
    { method: :low, expect: :dim },
    { method: :medium, expect: :medium },
    { method: :high, expect: :bright }
  ].freeze

  def test_set_light_brightness_level
    LIGHT_TEST_CASES.each do |test_case|
      # Arrange
      light = Light.new
      switch = TriLevelSwitch.new(device: light)
      switch.turn_on
      assert_equal :bright, light.brightness

      # Act
      switch.send(test_case[:method])

      # Assert
      assert_equal test_case[:expect], light.brightness
    end
  end

  FAN_TEST_CASES = [
    { method: :low, expect: :low },
    { method: :medium, expect: :medium },
    { method: :high, expect: :high }
  ].freeze

  def test_set_fan_speed_level
    FAN_TEST_CASES.each do |test_case|
      # Arrange
      fan = Fan.new
      switch = TriLevelSwitch.new(device: fan)
      switch.turn_on
      assert_equal :medium, fan.speed

      # Act
      switch.send(test_case[:method])

      # Assert
      assert_equal test_case[:expect], fan.speed
    end
  end
end
