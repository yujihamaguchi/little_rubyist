# frozen_string_literal: true

require_relative "../product/sports_car_body"
require_relative "sports_car_builder"

class SportsCarBodyBuilder < SportsCarBuilder
  def build
    body = SportsCarBody.new
    body.engine = @engine_type
    body.seats = @seat_count
    body
  end
end
