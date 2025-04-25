# frozen_string_literal: true

require_relative "command"

class CopyCommand < Command
  def execute
    @receiver.clipboard = @receiver.content.dup
  end

  def undo; end
end
