# frozen_string_literal: true

class RemoteControl
  attr_accessor :button_layout, :undo_command, :display_message

  def initialize
    @button_layout = {}
  end

  def push_on_button(slot_number:)
    @undo_command = off_command(slot_number)
    begin
      on_command(slot_number).execute
    rescue StandardError => e
      @display_message = "Command failed because of #{e.message}"
    end
  end

  def on_command(slot_number)
    button_layout.dig(slot_number, :on)
  end

  def off_command(slot_number)
    button_layout.dig(slot_number, :off)
  end

  def add_command(slot_number:, on_command:, off_command:)
    button_layout[slot_number] = { on: on_command, off: off_command }
  end

  def push_off_button(slot_number:)
    @undo_command = on_command(slot_number)
    off_command(slot_number).execute
  end

  def push_undo_button
    undo_command.execute
  end
end
