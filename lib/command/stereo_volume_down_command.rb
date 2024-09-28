# frozen_string_literal: true

require_relative "command"

class StereoVolumeDownCommand < Command
  def execute
    @receiver.volume_down
  end
end
