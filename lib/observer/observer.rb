# frozen_string_literal: true

class Observer
  def initialize(subject:)
    @subject = subject
  end

  def update(subject: 100)
    raise NotImplementedError
  end
end
