# frozen_string_literal: true

require_relative "remote_control"

class AudioRemoteControl < Bridge::RemoteControl
  def mute
    @device.mute
  end
end
