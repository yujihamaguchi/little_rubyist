# frozen_string_literal: true

class Radio
  def initialize
    @enabled = false
  end

  def enabled?
    @enabled
  end

  def enable
    @enabled = true
  end

  def disable
    @enabled = false
  end
end
