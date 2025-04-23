# frozen_string_literal: true

require_relative "car_builder"
require_relative "../product/car_manual"

class CarManualBuilder < CarBuilder
  def build
    super
    manual = CarManual.new
    manual.engine = "#{@engine_type} manual"
    manual.seats = "#{@seat_count} seats"
    manual
  end
end
