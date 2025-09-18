# frozen_string_literal: true

class Subject
  def initialize
    @observers = []
  end

  def add(observer:)
    @observers << observer
  end

  def notify_all
    @observers.each do |observer|
      self.notify(observer)
    end
  end

  def notify(observer)
    raise NotImplementedError
  end
end
