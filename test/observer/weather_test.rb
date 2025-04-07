# frozen_string_literal: true

require_relative "../test_helper"

class WeatherTest < Minitest::Test
  def test_update
    # Arrange
    weather = Weather.new
    observer1 = CustomMock.new
    observer1.expect :notify, nil, subject: weather
    observer2 = CustomMock.new
    observer2.expect :notify, nil, subject: weather
    temperature = 10
    humidity = 2

    # Act
    weather.stub :observers, [observer1, observer2] do
      weather.update(temperature: temperature, humidity: humidity)
    end

    # Assert
    assert_equal temperature, weather.temperature
    assert_equal humidity, weather.humidity
    observer1.verify
    observer2.verify
  end
end
