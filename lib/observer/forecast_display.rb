# frozen_string_literal: true

require_relative "weather_observer"

class ForecastDisplay < WeatherObserver
  def notify(temperature:, humidity:)
    @temperature = temperature
    @humidity = humidity
  end

  def display
    "Forecast / temperature: #{@temperature}, humidity: #{@humidity}"
  end
end
