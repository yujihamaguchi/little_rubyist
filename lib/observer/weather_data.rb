# frozen_string_literal: true

class WeatherData
  attr_reader :temperature, :humidity

  def initialize
    @observers = Set.new
  end

  def register(observer:)
    @observers.add(observer)
  end

  def update(temperature:, humidity:)
    @temperature = temperature
    @humidity = humidity
    @observers.each do |observer|
      observer.update(subject: self)
    end
  end
end
