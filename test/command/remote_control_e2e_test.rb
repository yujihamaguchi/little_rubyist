# frozen_string_literal: true

require_relative "../test_helper"
require "command/fan"
require "command/stereo"
require "command/fan_on_command"
require "command/stereo_volume_up_command"
require "command/remote_control"

class RemoteControlE2eTest < Minitest::Test
  def test_push_on_button
    # Arrange
    fan = Fan.new
    stereo = Stereo.new
    init_volume = stereo.volume

    remote_control = RemoteControl.new
    fan_slot_number = 1
    fan_on_command = FanOnCommand.new(receiver: fan)
    stereo_slot_number = 2
    stereo_volume_up_command = StereoVolumeUpCommand.new(receiver: stereo)
    remote_control.add_command(slot: fan_slot_number, on_command: fan_on_command, off_command: nil)
    remote_control.add_command(slot: stereo_slot_number, on_command: stereo_volume_up_command, off_command: nil)

    # Act
    remote_control.push_on_button(slot: fan_slot_number)
    remote_control.push_on_button(slot: stereo_slot_number)

    # Assert
    assert_equal :on, fan.status
    assert_equal init_volume + 1, stereo.volume
  end
end
