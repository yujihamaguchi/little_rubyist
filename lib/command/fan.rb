# frozen_string_literal: true

class Fan
  attr_accessor :status

  def initialize
    @status = :off
  end

  def on
    @status = :on
  end

  def off
    @status = :off
  end
end
