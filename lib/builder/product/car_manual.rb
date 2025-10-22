# frozen_string_literal: true

require_relative "car_product"
class CarManual < CarProduct
  def engine
    "#{@engine.class.to_s.sub("Engine", "")} engine equipped"
  end

  def seats
    "#{@seats.count} seats"
  end

  def roof_rails
    "#{@roof_rails.first.color} roof rails".capitalize
  end
end
