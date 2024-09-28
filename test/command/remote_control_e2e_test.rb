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
    remote_control.add_command(slot: fan_slot_number, on_command: fan_on_command, off_command: nil)
    remote_control.add_command(slot: stereo_slot_number, on_command: stereo_volume_up_command, off_command: nil)

    # Act
    remote_control.push_on_button(slot: fan_slot_number)
    remote_control.push_on_button(slot: stereo_slot_number)

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
    remote_control.add_command(slot: fan_slot_number, on_command: fan_on_command, off_command: fan_off_command)
    remote_control.add_command(slot: stereo_slot_number, on_command: nil, off_command: stereo_volume_down_command)

    remote_control.push_on_button(slot: fan_slot_number)
    assert_equal :on, fan.status

    # Act
    remote_control.push_off_button(slot: fan_slot_number)
    remote_control.push_off_button(slot: stereo_slot_number)

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
    remote_control.add_command(slot: fan_slot_number, on_command: fan_on_command, off_command: fan_off_command)
    remote_control.add_command(slot: stereo_slot_number, on_command: stereo_volume_up_command,
                               off_command: stereo_volume_down_command)
    # Act 1
    remote_control.push_on_button(slot: fan_slot_number)
    assert_equal :on, fan.status
    remote_control.push_undo_button

    # Assert 1
    assert_equal :off, fan.status

    # Act 2
    remote_control.push_off_button(slot: stereo_slot_number)
    assert_equal init_volume - 1, stereo.volume
    remote_control.push_undo_button

    # Assert 2
    assert_equal init_volume, stereo.volume
  end
end
