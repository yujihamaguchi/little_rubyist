# frozen_string_literal: true

require_relative "subject"
class Weather < Observer::Subject
  attr_reader :temperature, :humidity

  def update(temperature:, humidity:)
    @temperature = temperature
    @humidity = humidity
    @observers.each { |observer| observer.update(temperature: @temperature, humidity: @humidity) }
  end
end
