# frozen_string_literal: true

require_relative "remote_control"
class AudioRemoteControl < Bridge::RemoteControl
  def bass
    @device.sound_effect = :BASS
  end

  def treble
    @device.sound_effect = :TREBLE
  end

  def loudness
    @device.sound_effect = :LOUDNESS
  end
end
