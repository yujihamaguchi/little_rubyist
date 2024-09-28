# frozen_string_literal: true

require_relative "command"

class FanOffCommand < Command
  def execute
    @receiver.off
  end
end
