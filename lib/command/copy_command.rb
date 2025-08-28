# frozen_string_literal: true

require_relative "editor_command"
class CopyCommand < EditorCommand
  def execute
    @receiver.clipboard = @receiver.content
  end

  def undo
    # no op
  end
end
