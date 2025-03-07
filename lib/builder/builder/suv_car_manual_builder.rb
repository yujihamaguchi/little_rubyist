# frozen_string_literal: true
require_relative "suv_car_builder"
require_relative "../product/suv_car_manual"

class SUVCarManualBuilder < SUVCarBuilder
  def build
    manual = SUVCarManual.new
    manual.engine = @type
    manual.seats = @count
    manual
  end
end
