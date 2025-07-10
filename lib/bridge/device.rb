# frozen_string_literal: true

class Device
  attr_reader :enabled

  def disable
    @enabled = false
  end

  def enable
    @enabled = true
  end

  def enabled?
    @enabled
  end

  def initialize
    @enabled = false
  end
end
