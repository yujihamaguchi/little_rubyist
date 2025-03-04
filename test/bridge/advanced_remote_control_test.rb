# frozen_string_literal: true

require "minitest/autorun"

class AdvancedRemoteControlTest < Minitest::Test
  def test_mute
    # Arrange
    device = CustomMock.new
    device.expect :volume=, nil, [0]
    advanced_remote_control = AdvancedRemoteControl.new(device: device)

    # Act
    advanced_remote_control.mute

    # Arrange
    device.verify
  end
end
