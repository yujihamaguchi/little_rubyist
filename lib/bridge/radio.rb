# frozen_string_literal: true

require_relative "device"

class Radio < Device
  attr_accessor :volume

  def initialize
    @volume = 5
    super
  end
end
