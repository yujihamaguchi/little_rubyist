# frozen_string_literal: true

class Weather
  def initialize
    @observers = []
  end

  def add(observer:)
    @observers << observer
  end

  def update(temperature:, humidity:)
    @observers.each { |observer| observer.update(temperature: temperature, humidity: humidity) }
  end
end
