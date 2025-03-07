# frozen_string_literal: true
require_relative 'suv_car'

class SUVCarBody
  include SUVCar
  attr_accessor :engine, :seats, :roof_rails
end
