# frozen_string_literal: true

class Weather
  def initialize
    @observers = []
  end

  def add(observer:)
    @observers.push(observer)
  end

  def update(temperature:, humidity:)
    @observers.each do |observer|
      observer.update(temperature: temperature, humidity: humidity)
    end
  end
end
