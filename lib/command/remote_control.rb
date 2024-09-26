# frozen_string_literal: true

class RemoteControl
  attr_accessor :command_map

  def push_on_button(slot:)
    command = command_map.dig(slot, :on)
    command.execute
  end

  def add_command(slot:, on_command:, off_command:) end
end
