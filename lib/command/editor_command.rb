# frozen_string_literal: true

class EditorCommand
  def initialize(receiver:)
    @receiver = receiver
  end

  def execute
    raise NotImplementedError
  end

  def undo
    raise NotImplementedError
  end
end
