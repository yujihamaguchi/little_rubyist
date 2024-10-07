# frozen_string_literal: true

class RemoteControl
  attr_accessor :button_layout, :undo_command, :display_message

  def initialize
    @button_layout = {}
  end

  def add_command(slot_number:, on_command:, off_command:)
    button_layout[slot_number] = { on: on_command, off: off_command }
  end

  def push_on_button(slot_number:)
    on_command(slot_number).execute
    @undo_command = off_command(slot_number)
  rescue NoMethodError => _e
    @display_message = "No command is assigned to on button of slot number #{slot_number}"
  rescue StandardError => e
    @display_message = display_message_with(error: e)
  end

  def push_off_button(slot_number:)
    off_command(slot_number).execute
    @undo_command = on_command(slot_number)
  rescue NoMethodError => _e
    @display_message = "No command is assigned to off button of slot number #{slot_number}"
  rescue StandardError => e
    @display_message = display_message_with(error: e)
  end

  def push_undo_button
    undo_command.execute
  rescue NoMethodError => _e
    @display_message = "Cannot perform the undo operation"
  rescue StandardError => e
    @display_message = display_message_with(error: e)
  end

  private

  def display_message_with(error:)
    "Command failed because of #{error.message}"
  end

  def on_command(slot_number)
    button_layout.dig(slot_number, :on)
  end

  def off_command(slot_number)
    button_layout.dig(slot_number, :off)
  end
end
