# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/memento/originator"
require_relative "../../lib/memento/caretaker"

class OriginatorE2eTest < Minitest::Test
  def setup
    @originator = Originator.new
    @caretaker = Caretaker.new
  end

  TEST_CASES = [{ index: 0, state: :state1 }, { index: 1, state: :state2 }].freeze

  def test_restore_from_memento
    # Arrange
    @originator.state = :state1
    @caretaker.add_memento(@originator.memento)
    @originator.state = :state2
    @caretaker.add_memento(@originator.memento)
    @originator.state = :state3

    TEST_CASES.each do |test_case|
      # Act
      memento = @caretaker.memento_at(test_case[:index])
      @originator.restore_from(memento: memento)

      # Assert
      assert_equal test_case[:state], @originator.state
    end
  end

  def test_memento
    # Arrange
    @originator.state = :some_state

    # Act
    memento = @originator.memento

    # Assert
    assert_equal :some_state, memento.state
  end
end
