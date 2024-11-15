# frozen_string_literal: true

class Caretaker
  def initialize
    @mementos = []
  end

  def add_memento(memento)
    @mementos << memento
  end

  def memento_at(index)
    @mementos[index]
  end
end
