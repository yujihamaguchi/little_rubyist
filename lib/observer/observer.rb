# frozen_string_literal: true

class Observer
  def initialize(subject:)
    subject.add(observer: self)
    @subject = subject
  end

  def notify(subject:)
    raise NotImplementedError
  end
end
