# frozen_string_literal: true

class RemoteControl
  attr_accessor :command_map, :undo_command

  def initialize
    @command_map = {}
  end

  def push_on_button(slot_number:)
    @undo_command = off_command(slot_number)
    on_command(slot_number).execute
  end

  def on_command(slot_number)
    command_map.dig(slot_number, :on)
  end

  def off_command(slot_number)
    command_map.dig(slot_number, :off)
  end

  def add_command(slot_number:, on_command:, off_command:)
    command_map[slot_number] = { on: on_command, off: off_command }
  end

  def push_off_button(slot_number:)
    @undo_command = on_command(slot_number)
    off_command(slot_number).execute
  end

  def push_undo_button
    undo_command.execute
  end
end
