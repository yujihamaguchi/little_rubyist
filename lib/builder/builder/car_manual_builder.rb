# frozen_string_literal: true

require_relative "car_builder"
require_relative "../product/manual"
class CarManualBuilder < CarBuilder
  def build
    manual = Manual.new
    manual.engine = "#{@engine_type} manual"
    manual.seats = "#{@seat_count} seats"
    manual
  end
end
