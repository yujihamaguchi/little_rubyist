# frozen_string_literal: true

require_relative "sports_car"

class SportsCarManual
  include SportsCar
  attr_accessor :engine, :seats

  def engine
    "#{@engine} manual"
  end

  def seats
    "#{@seats} seats"
  end
end
