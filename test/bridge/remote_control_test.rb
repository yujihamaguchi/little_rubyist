# frozen_string_literal: true

require "minitest/autorun"
require_relative "../test_helper"
require_relative "../../lib/bridge/remote_control"

class RemoteControlTest < Minitest::Test
  def test_toggle_power_when_device_enabled
    # Arrange
    device = CustomMock.new
    device.expect :enabled?, true
    device.expect :disable, nil
    remote_control = Bridge::RemoteControl.new(device: device)

    # Act
    remote_control.toggle_power

    # Assert
    device.verify
  end

  def test_toggle_power_when_device_disabled
    # Arrange
    device = CustomMock.new
    device.expect :enabled?, false
    device.expect :enable, nil
    remote_control = Bridge::RemoteControl.new(device: device)

    # Act
    remote_control.toggle_power

    # Assert
    device.verify
  end
end
