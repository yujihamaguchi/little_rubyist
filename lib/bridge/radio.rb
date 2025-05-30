# frozen_string_literal: true

require_relative "device"
class Radio < Device
  attr_reader :volume

  def initialize
    @volume = 5
    super
  end

  def volume=(level)
    @volume = level if self.enabled?
  end
end
