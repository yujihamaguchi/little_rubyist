# frozen_string_literal: true

class RemoteControl
  attr_reader :button_layout, :last_command, :display_message

  def initialize
    @button_layout = {}
  end

  def add_command(slot_number:, on_command:, off_command:)
    button_layout[slot_number] = { on: on_command, off: off_command }
  end

  def push_on_button(slot_number:)
    if (command = on_command(slot_number))
      command.execute
      @last_command = command
    else
      @display_message = "No command is assigned to on button of slot number #{slot_number}"
    end
  rescue StandardError => e
    @display_message = display_message_with(error: e)
  end

  def push_off_button(slot_number:)
    if (command = off_command(slot_number))
      command.execute
      @last_command = command
    else
      @display_message = "No command is assigned to off button of slot number #{slot_number}"
    end
  rescue StandardError => e
    @display_message = display_message_with(error: e)
  end

  def push_undo_button
    if last_command
      last_command.undo
    else
      @display_message = "Cannot perform the undo operation"
    end
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
