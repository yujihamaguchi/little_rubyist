# frozen_string_literal: true

require_relative "command"
class CutCommand < Command
  def execute
    @undo_content = @receiver.content
    @receiver.clipboard = @receiver.content
    @receiver.content = ""
  end

  def undo
    @receiver.content = @undo_content
  end
end
