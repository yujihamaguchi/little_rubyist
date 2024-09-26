# frozen_string_literal: true

require_relative "../test_helper"

class RemoteControlTest < Minitest::Test
  def test_push_on_button
    # Arrange
    remote_control = RemoteControl.new
    command = CustomMock.new
    command.expect :execute, nil
    command_map = CustomMock.new
    slot_number = CustomMock.new
    command_map.expect :dig, command, [slot_number, :on]

    # Act
    remote_control.stub :command_map, command_map do
      remote_control.push_on_button(slot: slot_number)
    end
    # Assert
    command_map.verify
    command.verify
  end
end
