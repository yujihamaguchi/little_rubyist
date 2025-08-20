# frozen_string_literal: true

require_relative "device"
class HighEndAudio < Device
  attr_reader :sound_effect

  def initialize
    super
    @sound_effect = :EQ
  end

  def sound_effect=(type)
    @sound_effect = type if self.enabled?
  end
end
