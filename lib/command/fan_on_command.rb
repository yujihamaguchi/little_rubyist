# frozen_string_literal: true

require_relative "command"

class FanOnCommand < Command
  def execute
    @receiver.on
  end

  def undo
    @receiver.off
  end
end
