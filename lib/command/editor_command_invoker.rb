# frozen_string_literal: true

class EditorCommandInvoker
  def initialize
    @command_map = {}
  end

  def add_command(name:, command:)
    @command_map.store(name, command)
  end

  def push_button(name)
    @last_command = @command_map.fetch(name)
    @last_command.execute
  end

  def push_undo_button
    @last_command&.undo
  end
end
