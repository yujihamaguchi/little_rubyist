# frozen_string_literal: true

class Weather
  attr_reader :temperature, :humidity, :observers

  def initialize
    @observers = []
  end

  def add(observer:)
    @observers.push(observer)
  end

  def update(temperature:, humidity:)
    @temperature = temperature
    @humidity = humidity
    observers.each { |observer| observer.notify(temperature: @temperature, humidity: @humidity) }
  end
end
