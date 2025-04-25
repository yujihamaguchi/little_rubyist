# frozen_string_literal: true

require_relative "command"

class CutCommand < Command
  def execute
    @receiver.clipboard = @receiver.content.dup
    @receiver.content = ""
  end

  def undo
    @receiver.content = @receiver.clipboard.dup
  end
end
