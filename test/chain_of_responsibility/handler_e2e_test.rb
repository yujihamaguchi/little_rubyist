require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/leave_request"
require_relative "../../lib/chain_of_responsibility/manager"
require_relative "../../lib/chain_of_responsibility/general_manager"
require_relative "../../lib/chain_of_responsibility/ceo"

# クライアントはレスポンダーを意識せずリクエストを行い、しかるべきレスポンダーからレスポンスを得られる。また、レスポンダーの増減や並び替えがクライアントに影響しないようにしたい。
class HandlerE2eTest < Minitest::Test
  def setup
    @ceo = CEO.new(next_handler: nil)
    @general_manager = GeneralManager.new(next_handler: @ceo)
    @manager = Manager.new(next_handler: @general_manager)
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

  def test_general_manager_approval
    [4, 5].each do |days|
      # Arrange
      leave_request = LeaveRequest.new(days: days)

      # Act
      result = @manager.handle(leave_request)

      # Assert
      assert_equal "General manager approved #{days}-day leave.", result
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
