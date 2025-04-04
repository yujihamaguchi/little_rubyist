# frozen_string_literal: true

class Caretaker
  def initialize
    @mementos = []
  end

  def add_memento(memento)
    @mementos.push(memento)
  end

  def memento_at(index)
    @mementos[index]
  end
end
