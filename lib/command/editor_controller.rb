# frozen_string_literal: true

class EditorController
  def initialize
    @commands = {}
  end

  def add_command(slot_number:, command:)
    @commands[slot_number] = command
  end

  def push_button(slot_number:)
    @commands[slot_number].execute
  end

  def push_undo_button; end
end
