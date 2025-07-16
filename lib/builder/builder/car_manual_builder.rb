# frozen_string_literal: true

require_relative "car_builder"
require_relative "../product/manual"
class CarManualBuilder
  include CarBuilder

  def with_engine(engine)
    @engine = engine
    self
  end

  def with_seat(count: 2)
    @seat_count = count
    self
  end

  def with_roof_rails(roof_rails)
    @roof_rails = roof_rails
    self
  end

  def build
    manual = Manual.new(engine: @engine, seat_count: @seat_count)
    manual.roof_rails = @roof_rails
    manual
  end
end
