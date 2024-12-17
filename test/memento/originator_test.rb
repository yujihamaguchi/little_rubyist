# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/memento/originator"

class OriginatorTest < Minitest::Test
  def test_restore_from_memento
    # Arrange
    memento = CustomMock.new
    memento.expect :state, :some_state

    originator = Originator.new
    refute_equal :some_state, originator.state

    # Act
    originator.restore_from(memento: memento)

    # Assert
    memento.verify
    assert_equal :some_state, originator.state
  end
end
