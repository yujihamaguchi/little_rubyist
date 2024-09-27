# frozen_string_literal: true

require_relative "command"

class StereoVolumeUpCommand < Command
  def execute
    @receiver.volume_up
  end
end
