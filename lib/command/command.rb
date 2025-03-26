# frozen_string_literal: true

class Command
  def initialize(receiver:)
    @receiver = receiver
  end

  def execute
    raise NotImplementedError
  end
end
