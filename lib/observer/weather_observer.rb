# frozen_string_literal: true

class WeatherObserver
  def initialize(subject:)
    subject.add(observer: self)
  end

  def update(temperature:, humidity:)
    @temperature = temperature
    @humidity = humidity
  end
end
