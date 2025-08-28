# frozen_string_literal: true

require_relative "editor_command"
class CutCommand < EditorCommand
  def execute
    @cut_content = @receiver.content
    @receiver.clipboard = @cut_content
    @receiver.content = ""
  end

  def undo
    @receiver.content = @cut_content
  end
end
