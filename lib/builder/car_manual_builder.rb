# frozen_string_literal: true

require_relative "builder"
require_relative "car_manual"

class CarManualBuilder
  include Builder
  attr_reader :manual

  def initialize
    @manual = CarManual.new
  end

  def engine(engine_type:)
    @manual.engine = "#{engine_type} manual"
  end

  def seats(seat_count:)
    @manual.seats = "#{seat_count} seats"
  end

  def result
    @manual
  end
end
