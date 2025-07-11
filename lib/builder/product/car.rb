# frozen_string_literal: true

class Car
  attr_reader :engine, :seats

  def initialize(engine_type:, seats:)
    @engine = engine_type
    @seats = seats
  end
end
