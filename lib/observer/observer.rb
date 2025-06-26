# frozen_string_literal: true

class Observer
  def initialize(subject:)
    subject.add(observer: self)
  end

  def update(temperature:, humidity:)
    @temperature = temperature
    @humidity = humidity
  end
end
