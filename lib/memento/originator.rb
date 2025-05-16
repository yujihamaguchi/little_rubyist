# frozen_string_literal: true

class Originator
  attr_reader :state

  def memento
    Memento.new(self)
  end

  def restore_from(memento:)
    @state = memento.state
  end

  private

  attr_writer :state

  class Memento
    attr_reader :state

    def initialize(object)
      @state = object.state
    end
  end

  private_constant :Memento
end
