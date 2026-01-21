# frozen_string_literal: true

require_relative "car_builder"
require_relative "../product/car_manual"
class CarManualBuilder < CarBuilder
  def build
    car_manual = CarManual.new
    car_manual.engine = "#{@engine.class.name} equipped"
    car_manual.seats = "#{@seats.count} seats"
    car_manual.roof_rails = "#{@roof_rails&.first&.color} roof rails"
    car_manual
  end
end
