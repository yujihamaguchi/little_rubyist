# frozen_string_literal: true

require_relative "car"
class CarBody < Car
  attr_reader :engine, :seats, :roof_rails
end
