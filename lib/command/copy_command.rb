# frozen_string_literal: true

class CopyCommand < Command
  def execute
    @receiver.clipboard = @receiver.content
  end

  def undo; end
end
