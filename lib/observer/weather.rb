# frozen_string_literal: true

require_relative "subject"
class Weather < Subject
  attr_reader :temperature, :humidity

  def update(temperature:, humidity:)
    @temperature = temperature
    @humidity = humidity
    self.notify_all
  end

  def notify(observer)
    observer.update(temperature: @temperature, humidity: @humidity)
  end
end
