# frozen_string_literal: true

require_relative "car_product"
class CarBody < CarProduct
  attr_reader :engine, :seats, :roof_rails
end
