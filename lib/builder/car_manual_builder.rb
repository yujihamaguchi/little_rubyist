# frozen_string_literal: true

require_relative "builder"
require_relative "car_manual"

class CarManualBuilder
  include Builder
  attr_reader :manual

  def initialize
    @manual = CarManual.new
  end

  def with_engine(engine_type:)
    @manual.engine = "#{engine_type} manual"
    self
  end

  def with_seats(seat_count:)
    @manual.seats = "#{seat_count} seats"
    self
  end

  def with_roof_rails(color:)
    self
  end

  def build
    @manual
  end
end
