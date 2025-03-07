# frozen_string_literal: true
require_relative "suv_car"

class SUVCarManual
  include SUVCar
  attr_writer :engine, :seats

  def engine
    "#{@engine} manual"
  end

  def seats
    "#{@seats} seats"
  end

  def roof_rails

  end
end
