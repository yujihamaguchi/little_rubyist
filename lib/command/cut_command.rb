# frozen_string_literal: true
require_relative "command"

class CutCommand < Command
  def execute
    @receiver.clipboard = @receiver.content
    @receiver.content = ""
  end
end
