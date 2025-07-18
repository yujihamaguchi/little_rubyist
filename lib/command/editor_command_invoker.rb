# frozen_string_literal: true

class EditorCommandInvoker
  def initialize
    @commands = {}
  end

  def add_command(name:, command:)
    @commands.store(name, command)
  end

  def push_button(name)
    @last_command = @commands.fetch(name)
    @last_command.execute
  end

  def push_undo_button
    @last_command&.undo
  end
end
