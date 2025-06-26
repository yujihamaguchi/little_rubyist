# frozen_string_literal: true

require_relative "observer"
class ForecastDisplay < Observer
  def display
    "Forecast / temperature: #{@temperature}, humidity: #{@humidity}"
  end
end
