require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/leave_request"
require_relative "../../lib/chain_of_responsibility/manager"
require_relative "../../lib/chain_of_responsibility/director"
require_relative "../../lib/chain_of_responsibility/ceo"

# 送信元は処理者を意識せずリクエストを行い、しかるべき処理者からレスポンスを得られる。また、処理者の増減や並び替えが送信元に影響しないようにしたい
class HandlerE2eTest < Minitest::Test
  def setup
    @ceo = CEO.new(next_handler: nil)
    @director = ChainOfResponsibility::Director.new(next_handler: @ceo)
    @manager = Manager.new(next_handler: @director)
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
end
