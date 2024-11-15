# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/memento/originator"
require_relative "../../lib/memento/caretaker"

class OriginatorE2eTest < Minitest::Test
  def test_restore_from_memento
    # Arrange
    originator = Originator.new
    caretaker = Caretaker.new

    originator.state = :state1
    originator.state = :state2
    caretaker.add_memento(originator.memento)
    originator.state = :state3
    caretaker.add_memento(originator.memento)
    originator.state = :state4

    # Act
    memento = caretaker.memento_at(1)
    originator.restore_from(memento: memento)

    # Assert
    assert_equal :state3, originator.state
  end

  def test_memento
    # Arrange
    originator = Originator.new
    originator.state = :some_state

    # Act
    memento = originator.memento

    # Assert
    assert_equal :some_state, memento.state
  end
end
