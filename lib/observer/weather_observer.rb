# frozen_string_literal: true

class WeatherObserver
  def initialize(subject:)
    subject.add(observer: self)
  end

  def notify(temperature:, humidity:)
    raise NotImplementedError
  end
end
