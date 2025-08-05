# frozen_string_literal: true

require_relative "weather_observer"
class ForecastDisplay < WeatherObserver
  def display
    "Forecast / temperature: #{@temperature}, humidity: #{@humidity}"
  end
end
