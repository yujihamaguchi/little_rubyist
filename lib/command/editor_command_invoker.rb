# frozen_string_literal: true

class EditorCommandInvoker
  def initialize
    @commands_by_name = {}
  end

  def add_command(name:, command:)
    @commands_by_name.store(name, command)
  end

  def push_button(name)
    @last_command = @commands_by_name.fetch(name)
    @last_command.execute
  end

  def push_undo_button
    @last_command&.undo
  end
end
