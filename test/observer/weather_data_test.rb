# frozen_string_literal: true

require "observer/weather_data"

class WeatherDataTest < Minitest::Test
  def test_update
    # Arrange
    subject = WeatherData.new
    observer1 = CustomMock.new
    observer1.expect :update, nil, subject: subject
    observer2 = CustomMock.new
    observer2.expect :update, nil, subject: subject
    subject.register(observer: observer1)
    subject.register(observer: observer2)

    # Act
    subject.update(temperature: CustomMock.new, humidity: CustomMock.new)

    # Assert
    observer1.verify
    observer2.verify
  end
end
