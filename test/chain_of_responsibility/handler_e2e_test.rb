require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/leave_request"
require_relative "../../lib/chain_of_responsibility/manager"
require_relative "../../lib/chain_of_responsibility/director"
require_relative "../../lib/chain_of_responsibility/ceo"

# 送信元は処理者を意識せずリクエストを投げ、複数の候補が順に「自分が対応すべきか」を判定しつつ、候補の増減や並び替えが送信元に影響しない仕組みが欲しい
class HandlerE2eTest < Minitest::Test
  def setup
    @manager = Manager.new
    @director = ChainOfResponsibility::Director.new
    @ceo = CEO.new

    @manager.next_handler = @director
    @director.next_handler = @ceo
  end

  def test_manager_approval
    (1..3).each do |days|
      # Arrange
      leave_request = LeaveRequest.new(days: days)

      # Act
      result = @manager.handle(leave_request)

      # Assert
      assert_equal "Manager approved #{days}-day leave.", result
    end
  end

  def test_director_approval
    [4, 5].each do |days|
      # Arrange
      leave_request = LeaveRequest.new(days: days)

      # Act
      result = @manager.handle(leave_request)

      # Assert
      assert_equal "Director approved #{days}-day leave.", result
    end
  end

  def test_ceo_approval
    (6..10).each do |days|
      # Arrange
      leave_request = LeaveRequest.new(days: days)

      # Act
      result = @manager.handle(leave_request)

      # Assert
      assert_equal "CEO approved #{days}-day leave.", result
    end
  end

  def test_ceo_is_terminal_handler
    # Act & Assert
    error = assert_raises(RuntimeError) do
      @ceo.next_handler = @director
    end
    assert_equal "CEO must be the end of the chain", error.message
  end
end
