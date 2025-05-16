# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/memento/originator"
require_relative "../../lib/memento/caretaker"

# オブジェクトの内部状態を（必要に応じた属性だけでも）スナップショットとして取り出し、安全に保存しておき、後から同じ内部状態に復元できるようにする
class OriginatorE2eTest < Minitest::Test
  def setup
    @originator = Originator.new
    @caretaker = Caretaker.new
  end

  TEST_CASES = [
    { index: 0, state: :state1 },
    { index: 1, state: :state2 }
  ].freeze

  def test_restore_from_memento
    # Arrange
    @originator.send(:state=, :state1)
    @caretaker.add_memento(@originator.memento)
    @originator.send(:state=, :state2)
    @caretaker.add_memento(@originator.memento)
    @originator.send(:state=, :state3)

    TEST_CASES.each do |test_case|
      # Act
      memento = @caretaker.memento_at(test_case[:index])
      @originator.restore_from(memento: memento)

      # Assert
      assert_equal test_case[:state], @originator.state
    end
  end
end
