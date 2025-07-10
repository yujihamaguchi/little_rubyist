# frozen_string_literal: true

require_relative "device"
class Radio < Device
  attr_reader :volume

  def initialize
    super
    @volume = 5
  end

  def mute
    @volume = 0
  end
end
