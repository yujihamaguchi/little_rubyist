# frozen_string_literal: true

require_relative "memento"

class Originator
  attr_accessor :state

  def restore_from(memento:)
    @state = memento.state
  end

  def memento
    Memento.new(state: @state)
  end
end
