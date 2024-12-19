# frozen_string_literal: true

class Memento
  attr_reader :state

  def initialize(state:)
    @state = state
  end
end
