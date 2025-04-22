# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/bridge/remote_control"
require_relative "../../lib/bridge/radio"
require_relative "../../lib/bridge/audio_remote_control"

class RemoteControlForRadioE2eTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    radio = Radio.new
    refute radio.enabled?
    remote_control = Bridge::RemoteControl.new(device: radio)

    # Act
    remote_control.toggle_power

    # Assert
    assert radio.enabled?
  end

  def test_toggle_power_when_enabled
    # Arrange
    radio = Radio.new
    remote_control = Bridge::RemoteControl.new(device: radio)
    remote_control.toggle_power
    assert radio.enabled?

    # Act
    remote_control.toggle_power

    # Assert
    refute radio.enabled?
  end

  def test_mute
    # Arrange
    radio = Radio.new
    assert_equal radio.volume, 5
    remote_control = AudioRemoteControl.new(device: radio)
    remote_control.toggle_power
    assert radio.enabled?

    # Act
    remote_control.mute

    # Assert
    assert_equal 0, radio.volume
  end

  def test_mute_when_disabled
    # Arrange
    radio = Radio.new
    assert_equal 5, radio.volume
    refute radio.enabled?
    remote_control = AudioRemoteControl.new(device: radio)

    # Act
    remote_control.mute

    # Assert
    assert_equal 5, radio.volume
  end
end
