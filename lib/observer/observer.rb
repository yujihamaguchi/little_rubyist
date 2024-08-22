# frozen_string_literal: true

class Observer
  def initialize(subject:)
    subject.register(observer: self)
  end

  def update(subject:)
    raise NotImplementedError
  end
end
