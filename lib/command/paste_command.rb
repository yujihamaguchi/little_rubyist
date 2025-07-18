# frozen_string_literal: true

require_relative "command"
class PasteCommand < Command
  def execute
    @undo_content = @receiver.content
    @receiver.content += @receiver.clipboard
  end

  def undo
    @receiver.content = @undo_content
  end
end
