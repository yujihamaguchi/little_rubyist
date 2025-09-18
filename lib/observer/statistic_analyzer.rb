# frozen_string_literal: true

require_relative "weather_observer"
class StatisticAnalyzer < WeatherObserver
  def update(temperature:, humidity:)
    @temperature = temperature
  end

  def analyze
    "Statistic / temperature: #{@temperature} is #{@temperature <= 10 ? :cold : :warm}!"
  end
end
