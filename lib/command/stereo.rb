# frozen_string_literal: true

class Stereo
  attr_accessor :volume

  def initialize
    @volume = 5
  end

  def volume_up
    @volume += 1
  end

  def volume_down
    @volume -= 1
  end
end
