# frozen_string_literal: true

require_relative "sports_car_builder"
require_relative "../product/sports_car_manual"

class SportsCarManualBuilder < SportsCarBuilder
  def build
    manual = SportsCarManual.new
    manual.engine = @type
    manual.seats = @count
    manual
  end
end
