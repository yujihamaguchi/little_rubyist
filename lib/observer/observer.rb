# frozen_string_literal: true

class Observer
  def initialize(subject:)
    subject.register(observer: self)
  end

  def update(subject: 100)
    raise NotImplementedError
  end
end
