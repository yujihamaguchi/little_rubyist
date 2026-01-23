# frozen_string_literal: true

require_relative "editor_command"
class CutCommand < EditorCommand
  def execute
    @receiver.clipboard = @receiver.content
    @receiver.content = ""
  end

  def undo
    @receiver.content = @receiver.clipboard
  end
end
