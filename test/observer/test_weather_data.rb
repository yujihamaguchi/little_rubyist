# frozen_string_literal: true

require_relative "../../lib/observer/weather_data"

class WeatherDataTest < Minitest::Test
  def test_update
    # Arrange
    subject = WeatherData.new
    observer1 = Minitest::Mock.new
    observer1.expect :update, nil, [{ subject: subject }]
    observer2 = Minitest::Mock.new
    observer2.expect :update, nil, [{ subject: subject }]
    subject.register(observer: observer1)
    subject.register(observer: observer2)

    temperature = Minitest::Mock.new
    humidity = Minitest::Mock.new

    # Act
    subject.update(temperature: temperature, humidity: humidity)

    # Assert
    observer1.verify
    observer2.verify
  end
end

