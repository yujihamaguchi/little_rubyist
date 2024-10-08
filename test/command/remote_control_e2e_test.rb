# frozen_string_literal: true

require_relative "../test_helper"
require "command/fan"
require "command/stereo"
require "command/fan_on_command"
require "command/stereo_volume_up_command"
require "command/remote_control"
require "command/fan_off_command"
require "command/stereo_volume_down_command"

class RemoteControlE2eTest < Minitest::Test
  def test_push_on_button
    # Arrange
    fan = Fan.new
    assert_equal :off, fan.status
    stereo = Stereo.new
    init_volume = stereo.volume

    fan_slot_number = 1
    fan_on_command = FanOnCommand.new(receiver: fan)
    stereo_slot_number = 2
    stereo_volume_up_command = StereoVolumeUpCommand.new(receiver: stereo)

    remote_control = RemoteControl.new
    remote_control.add_command(slot_number: fan_slot_number, on_command: fan_on_command, off_command: nil)
    remote_control.add_command(slot_number: stereo_slot_number, on_command: stereo_volume_up_command, off_command: nil)

    # Act
    remote_control.push_on_button(slot_number: fan_slot_number)
    remote_control.push_on_button(slot_number: stereo_slot_number)

    # Assert
    assert_equal :on, fan.status
    assert_equal init_volume + 1, stereo.volume
  end

  def test_push_off_button
    # Arrange
    fan = Fan.new
    assert_equal :off, fan.status
    stereo = Stereo.new
    init_volume = stereo.volume

    fan_slot_number = 1
    fan_on_command = FanOnCommand.new(receiver: fan)
    fan_off_command = FanOffCommand.new(receiver: fan)

    stereo_slot_number = 2
    stereo_volume_down_command = StereoVolumeDownCommand.new(receiver: stereo)

    remote_control = RemoteControl.new
    remote_control.add_command(slot_number: fan_slot_number, on_command: fan_on_command, off_command: fan_off_command)
    remote_control.add_command(slot_number: stereo_slot_number, on_command: nil,
                               off_command: stereo_volume_down_command)

    remote_control.push_on_button(slot_number: fan_slot_number)
    assert_equal :on, fan.status

    # Act
    remote_control.push_off_button(slot_number: fan_slot_number)
    remote_control.push_off_button(slot_number: stereo_slot_number)

    # Assert
    assert_equal :off, fan.status
    assert_equal init_volume - 1, stereo.volume
  end

  def test_push_undo_button
    # Arrange
    fan = Fan.new
    assert_equal :off, fan.status
    stereo = Stereo.new
    init_volume = stereo.volume

    fan_slot_number = 1
    fan_on_command = FanOnCommand.new(receiver: fan)
    fan_off_command = FanOffCommand.new(receiver: fan)
    stereo_slot_number = 2
    stereo_volume_up_command = StereoVolumeUpCommand.new(receiver: stereo)
    stereo_volume_down_command = StereoVolumeDownCommand.new(receiver: stereo)

    remote_control = RemoteControl.new
    remote_control.add_command(slot_number: fan_slot_number, on_command: fan_on_command, off_command: fan_off_command)
    remote_control.add_command(slot_number: stereo_slot_number, on_command: stereo_volume_up_command,
                               off_command: stereo_volume_down_command)
    # Act 1
    remote_control.push_on_button(slot_number: fan_slot_number)
    assert_equal :on, fan.status
    remote_control.push_undo_button

    # Assert 1
    assert_equal :off, fan.status

    # Act 2
    remote_control.push_off_button(slot_number: stereo_slot_number)
    assert_equal init_volume - 1, stereo.volume
    remote_control.push_undo_button

    # Assert 2
    assert_equal init_volume, stereo.volume
  end

  def test_push_on_button_and_its_command_failed
    # Arrange
    remote_control = RemoteControl.new
    command = CustomMock.new
    cause = "something wrong.."
    command.expect :execute, nil do
      raise cause
    end
    remote_control.add_command(slot_number: 1, on_command: command, off_command: nil)

    # Act
    remote_control.push_on_button(slot_number: 1)

    # Assert
    assert_equal "Command failed because of #{cause}", remote_control.display_message
  end

  def test_push_off_button_and_its_command_failed
    # Arrange
    remote_control = RemoteControl.new
    command = CustomMock.new
    command.expect :nil?, false
    cause = "something wrong.."
    command.expect :execute, nil do
      raise cause
    end
    remote_control.add_command(slot_number: 1, on_command: nil, off_command: command)

    # Act
    remote_control.push_off_button(slot_number: 1)

    # Assert
    assert_equal "Command failed because of #{cause}", remote_control.display_message
  end

  def test_push_undo_button_and_its_command_failed
    # Arrange
    remote_control = RemoteControl.new
    error_command = CustomMock.new
    cause = "something wrong.."
    error_command.expect :undo, nil do
      raise cause
    end
    remote_control.add_command(slot_number: 1, on_command: nil, off_command: error_command)

    # Act
    remote_control.stub :last_command, error_command do
      remote_control.push_undo_button
    end

    # Assert
    assert_equal "Command failed because of #{cause}", remote_control.display_message
  end

  def test_push_no_on_command_assigned_button
    # Arrange
    remote_control = RemoteControl.new
    slot_number = 1

    # Act
    remote_control.push_on_button(slot_number: slot_number)

    # Assert
    assert_equal "No command is assigned to on button of slot number #{slot_number}", remote_control.display_message
  end

  def test_push_no_off_command_assigned_button
    # Arrange
    remote_control = RemoteControl.new
    slot_number = 1

    # Act
    remote_control.push_off_button(slot_number: slot_number)

    # Assert
    assert_equal "No command is assigned to off button of slot number #{slot_number}", remote_control.display_message
  end

  def test_push_no_undo_command_assigned_button
    # Arrange
    remote_control = RemoteControl.new
    slot_number = 1
    command = CustomMock.new
    command.expect :undo, nil
    remote_control.add_command(slot_number: slot_number, on_command: command, off_command: nil)

    # Act
    remote_control.push_on_button(slot_number: slot_number)
    remote_control.push_undo_button

    # Assert
    assert_equal "Cannot perform the undo operation", remote_control.display_message
  end
end
