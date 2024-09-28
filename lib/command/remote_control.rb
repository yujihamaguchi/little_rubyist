# frozen_string_literal: true

class RemoteControl
  attr_accessor :command_map, :undo_command

  def initialize
    @command_map = {}
  end

  def push_on_button(slot:)
    on_command = command_map.dig(slot, :on)
    off_command = command_map.dig(slot, :off)
    @undo_command = off_command
    on_command.execute
  end

  def add_command(slot:, on_command:, off_command:)
    command_map[slot] = { on: on_command, off: off_command }
  end

  def push_off_button(slot:)
    command = command_map.dig(slot, :off)
    command.execute
  end

  def push_undo_button
    undo_command.execute
  end
end
