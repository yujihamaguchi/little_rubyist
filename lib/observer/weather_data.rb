# frozen_string_literal: true

class WeatherData
  def initialize
    @observers = Set.new
  end

  def register(observer:)
    @observers.add(observer)
  end

  def update(temperature:, humidity:)
    @observers.each { |observer| observer.update(subject: self) }
  end
end
