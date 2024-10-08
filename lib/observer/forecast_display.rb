# frozen_string_literal: true

require_relative "observer"

class ForecastDisplay < Observer
  def update(subject:)
    @temperature = subject.temperature
    @humidity = subject.humidity
  end

  def display
    "Forecast / temperature: #{@temperature}, humidity: #{@humidity}"
  end
end
