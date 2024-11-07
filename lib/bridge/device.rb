# frozen_string_literal: true

class Device
  attr_accessor :volume

  def initialize
    @enabled = false
  end

  def disable
    @enabled = false
  end

  def enable
    @enabled = true
  end

  def enabled?
    @enabled
  end
end
