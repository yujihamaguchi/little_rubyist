# frozen_string_literal: true

require_relative "../test_helper"

class RemoteControlTest < Minitest::Test
  def test_push_on_button
    # Arrange
    remote_control = RemoteControl.new
    on_command = CustomMock.new
    on_command.expect :execute, nil
    off_command = CustomMock.new
    command_map = CustomMock.new
    slot_number = CustomMock.new
    command_map.expect :dig, on_command, [slot_number, :on]
    command_map.expect :dig, off_command, [slot_number, :off]

    # Act
    remote_control.stub :command_map, command_map do
      remote_control.stub :undo_command=, lambda { |undo_command|
        assert_equal off_command, undo_command
      } do
        remote_control.push_on_button(slot: slot_number)
      end
    end
    # Assert
    command_map.verify
    on_command.verify
  end

  def test_push_off_button
    # Arrange
    remote_control = RemoteControl.new
    slot_number = CustomMock.new
    off_command = CustomMock.new
    off_command.expect :execute, nil
    on_command = CustomMock.new
    command_map = CustomMock.new
    command_map.expect :dig, off_command, [slot_number, :off]

    # Act
    remote_control.stub :command_map, command_map do
      remote_control.stub :undo_command=, lambda { |undo_command|
        assert_equal on_command, undo_command
      } do
        remote_control.push_off_button(slot: slot_number)
      end
    end

    # Assert
    command_map.verify
    off_command.verify
  end

  def test_push_undo_button
    # Arrange
    remote_control = RemoteControl.new
    undo_command = CustomMock.new
    undo_command.expect :execute, nil

    # Act
    remote_control.stub :undo_command, undo_command do
      remote_control.push_undo_button
    end

    # Assert
    undo_command.verify
  end
end
