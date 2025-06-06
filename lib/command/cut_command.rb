# frozen_string_literal: true

class CutCommand < Command
  def execute
    @receiver.clipboard = @receiver.content
    @receiver.content = ""
  end

  def undo
    @receiver.content = @receiver.clipboard
  end
end
