# frozen_string_literal: true
require_relative "command"

class PasteCommand < Command
  def execute
    @previous_content = @receiver.content
    @receiver.content += @receiver.clipboard
  end

  def undo
    @receiver.content = @previous_content
  end
end
