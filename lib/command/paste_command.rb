# frozen_string_literal: true

require_relative "editor_command"
class PasteCommand < EditorCommand
  def execute
    @last_content = @receiver.content
    @receiver.content += @receiver.clipboard
  end

  def undo
    @receiver.content = @last_content
  end
end
