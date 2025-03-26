# frozen_string_literal: true
require_relative "command"

class PasteCommand < Command
  def execute
    @receiver.content = @receiver.content + @receiver.clipboard
  end
end
