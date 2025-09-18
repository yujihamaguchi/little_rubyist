# frozen_string_literal: true

require_relative "observer"
class WeatherObserver < Observer
  def update(temperature:, humidity:)
    raise NotImplementedError
  end
end
