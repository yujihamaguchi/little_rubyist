# frozen_string_literal: true

require_relative "sports_car"

class SportsCarManual
  include SportsCar
  attr_writer :engine, :seats

  def engine
    "#{@engine} manual"
  end

  def seats
    "#{@seats} seats"
  end
end
