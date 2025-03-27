# frozen_string_literal: true
require_relative "command"

class CutCommand < Command
  def execute
    @receiver.clipboard = @receiver.content
    @previous_content = @receiver.content
    @receiver.content = ""
  end

  def undo
    @receiver.content = @previous_content
  end
end
