# frozen_string_literal: true

class EditorController
  def initialize
    @commands = {}
  end

  def add_command(slot_number:, command:)
    @commands[slot_number] = command
  end

  def push_button(slot_number:)
    command = @commands[slot_number]
    command.execute
    @last_command = command
  end

  def push_undo_button
    @last_command&.undo
  end
end
