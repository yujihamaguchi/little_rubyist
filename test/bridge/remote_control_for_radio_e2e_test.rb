# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/advanced_remote_control"
require_relative "../../lib/bridge/radio"

class RemoteControlForRadioE2eTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    radio = Radio.new
    assert_equal false, radio.enabled?
    remote_control = Bridge::RemoteControl.new(device: radio)

    # Act
    remote_control.toggle_power

    # Assert
    assert_equal true, radio.enabled?
  end

  def test_toggle_power_when_enabled
    # Arrange
    radio = Radio.new
    remote_control = Bridge::RemoteControl.new(device: radio)
    remote_control.toggle_power
    assert_equal true, radio.enabled?

    # Act
    remote_control.toggle_power

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
