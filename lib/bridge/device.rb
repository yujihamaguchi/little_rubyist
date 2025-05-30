# frozen_string_literal: true

class Device
  def initialize
    @enabled = false
  end

  def enable
    @enabled = true
  end

  def disable
    @enabled = false
  end

  def enabled?
    @enabled
  end
end
