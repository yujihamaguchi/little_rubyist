# frozen_string_literal: true
require_relative "car"

class CarManual < Car
  def engine
    "#{@engine} manual"
  end

  def seats
    "#{@seats} seats"
  end

  def roof_rails
    nil
  end
end
