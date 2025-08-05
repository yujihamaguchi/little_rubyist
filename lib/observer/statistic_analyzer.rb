# frozen_string_literal: true

require_relative "weather_observer"
class StatisticAnalyzer < WeatherObserver
  def analyze
    "Statistic / temperature: #{@temperature} is cold!"
  end
end
