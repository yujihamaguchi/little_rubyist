# frozen_string_literal: true

require_relative "../test_helper"
require "bridge/advanced_remote_control"
require "bridge/radio"

class RadioRemoteE2eTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    radio = Radio.new
    assert_equal false, radio.enabled?
    remote = Bridge::RemoteControl.new(device: radio)

    # Act
    remote.toggle_power

    # Assert
    assert_equal true, radio.enabled?
  end

  def test_toggle_power_when_enabled
    # Arrange
    radio = Radio.new
    remote = Bridge::RemoteControl.new(device: radio)
    remote.toggle_power
    assert_equal true, radio.enabled?

    # Act
    remote.toggle_power

    # Assert
    assert_equal false, radio.enabled?
  end

  def test_mute
    # Arrange
    radio = Radio.new
    remote = AdvancedRemoteControl.new(device: radio)

    # Act
    remote.mute

    # Assert
    assert_equal 0, radio.volume
  end
end
