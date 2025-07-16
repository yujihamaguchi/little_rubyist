# frozen_string_literal: true

class Car
  attr_reader :engine, :seat
  attr_accessor :roof_rails

  def initialize(engine:, seat:)
    @engine = engine
    @seat = seat
  end
end
