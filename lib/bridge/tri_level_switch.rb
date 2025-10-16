# frozen_string_literal: true

require_relative "switch"
class TriLevelSwitch < Switch
  def low
    @device.low
  end

  def medium
    @device.medium
  end

  def high
    @device.high
  end
end
