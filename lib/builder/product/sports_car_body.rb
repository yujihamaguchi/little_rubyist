# frozen_string_literal: true

require_relative "sports_car"

class SportsCarBody
  include SportsCar
  attr_accessor :engine, :seats
end
