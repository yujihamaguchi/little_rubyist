# frozen_string_literal: true

require_relative "car"
class CarManual < Car
  def engine
    "#{@engine.class.name} equipped"
  end

  def seats
    "#{@seats.count} seats"
  end

  def roof_rails
    "#{@roof_rails.color} roof rails" unless @roof_rails.nil?
  end
end
