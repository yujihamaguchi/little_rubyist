# frozen_string_literal: true

require_relative "../test_helper"

class RemoteControlTest < Minitest::Test
  def test_push_on_button
    # Arrange
    remote_control = RemoteControl.new
    slot_number = CustomMock.new
    on_command = CustomMock.new
    on_command.expect :execute, nil
    off_command = CustomMock.new

    # Act
    remote_control.stub :on_command, on_command, [slot_number] do
      remote_control.stub :off_command, off_command, [slot_number] do
        remote_control.push_on_button(slot_number: slot_number)
      end
    end

    # Assert
    on_command.verify
    assert_equal off_command, remote_control.undo_command
  end

  def test_push_off_button
    # Arrange
    remote_control = RemoteControl.new
    slot_number = CustomMock.new
    on_command = CustomMock.new
    off_command = CustomMock.new
    off_command.expect :execute, nil

    # Act
    remote_control.stub :off_command, off_command, [slot_number] do
      remote_control.stub :on_command, on_command, [slot_number] do
        remote_control.push_off_button(slot_number: slot_number)
      end
    end

    # Assert
    assert_equal on_command, remote_control.undo_command
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
