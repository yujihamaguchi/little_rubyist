# frozen_string_literal: true
require_relative "../product/suv_car_body"
require_relative "suv_car_builder"

class SUVCarBodyBuilder < SUVCarBuilder
  def build
    body = SUVCarBody.new
    body.engine = @type
    body.seats = @count
    body.roof_rails = @color
    body
  end
end
