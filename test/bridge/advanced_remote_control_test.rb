# frozen_string_literal: true

require_relative "../test_helper"

class AdvancedRemoteControlTest < Minitest::Test
  def test_mute
    # Arrange
    radio = CustomMock.new
    radio.expect :volume=, nil, [0]
    remote = AdvancedRemoteControl.new(device: radio)

    # Act
    remote.stub :device, radio do
      remote.mute
    end

    # Assert
    radio.verify
  end
end
