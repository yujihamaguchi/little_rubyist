# frozen_string_literal: true

class Originator
  attr_reader :state

  def update_state(new_state)
    @state = new_state
  end

  def memento
    Memento.new(self)
  end

  def restore_from(memento)
    @state = memento.state
  end

  class Memento
    attr_reader :state

    def initialize(originator)
      @state = originator.state
    end
  end
end
