# frozen_string_literal: true
require_relative "car_product"

class CarManual < CarProduct
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
