# frozen_string_literal: true

require_relative "weather_observer"

class StatisticAnalyzer < WeatherObserver
  def notify(temperature:, humidity:)
    @temperature = temperature
  end

  def analyze
    "Statistic / temperature: #{@temperature} is cold!"
  end
end
