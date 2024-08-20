# frozen_string_literal: true

require_relative "../../lib/observer/weather_data"
require_relative "../../lib/observer/forecast_display"
require_relative "../../lib/observer/statistic_analyze"

class WeatherDataE2eTest < Minitest::Test
  def test_display
    # Arrange
    subject = WeatherData.new
    observer1 = ForecastDisplay.new(subject: subject)
    observer2 = StatisticAnalyze.new(subject: subject)

    # Act
    temperature = 10
    humidity = 2
    subject.update(temperature: temperature, humidity: humidity)

    # Assert
    assert_equal "Forecast / temperature: #{temperature}, humidity: #{humidity}", observer1.display
    assert_equal "Statistic / temperature: #{temperature} is cold!", observer2.analyze
  end
end
