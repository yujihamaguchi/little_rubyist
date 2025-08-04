# frozen_string_literal: true

class Originator
  attr_reader :state

  def memento
    Memento.new(self)
  end

  def restore_from(memento)
    self.state = memento.state
    self
  end

  class Memento
    attr_reader :state

    def initialize(originator)
      @state = originator.state
    end
  end

  private

  attr_writer :state
end
