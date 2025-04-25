# frozen_string_literal: true

class EditorInvoker
  def initialize
    @commands = {}
  end

  def add_command(name:, command:)
    @commands.store(name, command)
  end

  def push_button(name)
    command = @commands.fetch(name)
    command.execute
    @last_command = command
  end

  def push_undo_button
    @last_command&.undo
  end
end
