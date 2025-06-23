# frozen_string_literal: true

class Originator
  attr_reader :state

  def memento
    memento = Memento.new
    memento.state = self.state
    memento
  end

  def restore_from(memento)
    self.state = memento.state
    self
  end

  private

  attr_writer :state

  class Memento
    attr_accessor :state
  end
end
