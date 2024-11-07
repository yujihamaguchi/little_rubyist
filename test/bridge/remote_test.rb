# frozen_string_literal: true

require_relative "../test_helper"

class RemoteTest < Minitest::Test
  def test_toggle_power_when_disabled
    # Arrange
    device = CustomMock.new
    device.expect :enabled?, false
    device.expect :enable, nil
    remote = Bridge::RemoteControl.new(device: device)

    # Act
    remote.stub :device, device do
      remote.toggle_power
    end

    # Assert
    device.verify
  end

  def test_toggle_power_when_enabled
    # Arrange
    device = CustomMock.new
    device.expect :enabled?, true
    device.expect :disable, nil
    remote = Bridge::RemoteControl.new(device: device)

    # Act
    remote.stub :device, device do
      remote.toggle_power
    end

    # Assert
    device.verify
  end
end
