# frozen_string_literal: true

class CarBody
  attr_reader :engine, :seats, :roof_rails

  def initialize(engine:, seats:, roof_rails: nil)
    @engine = engine
    @seats = seats
    @roof_rails = roof_rails unless roof_rails.nil?
  end
end
