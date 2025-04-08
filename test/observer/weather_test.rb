# frozen_string_literal: true

require_relative "../test_helper"

class WeatherTest < Minitest::Test
  def test_update
    # Arrange
    weather = Weather.new
    temperature = 10
    humidity = 2
    weather_observer1 = CustomMock.new
    weather_observer1.expect :notify, nil, temperature: temperature, humidity: humidity
    weather_observer2 = CustomMock.new
    weather_observer2.expect :notify, nil, temperature: temperature, humidity: humidity

    # Act
    weather.stub :observers, [weather_observer1, weather_observer2] do
      weather.update(temperature: temperature, humidity: humidity)
    end

    # Assert
    assert_equal temperature, weather.temperature
    assert_equal humidity, weather.humidity
    weather_observer1.verify
    weather_observer2.verify
  end
end
