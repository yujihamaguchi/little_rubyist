# frozen_string_literal: true
class Originator
  attr_reader :state

  def memento
    Memento.new(original: self)
  end

  def restore_from(memento:)
    @state = memento.state
  end

  private

  attr_writer :state

  class Memento
    attr_reader :state

    def initialize(original:)
      @state = original.state
    end
  end

  private_constant :Memento
end
