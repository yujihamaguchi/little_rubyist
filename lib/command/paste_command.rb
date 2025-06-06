# frozen_string_literal: true

class PasteCommand < Command
  def execute
    @prev_content = @receiver.content.dup
    @receiver.content += @receiver.clipboard
  end

  def undo
    @receiver.content = @prev_content
  end
end
