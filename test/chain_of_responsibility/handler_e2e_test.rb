require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/manager"
require_relative "../../lib/chain_of_responsibility/director"
require_relative "../../lib/chain_of_responsibility/ceo"
require_relative "../../lib/chain_of_responsibility/leave_request"

# どのハンドラがリクエストを処理するかを送信元に意識させずに、複数のハンドラが必要に応じて段階的に処理を委譲できる仕組みを作りたい
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
      request = LeaveRequest.new(days: days)

      # Act
      result = @manager.handle(leave_request: request)

      # Assert
      assert_equal "Manager approved #{days}-day leave.", result
    end
  end

  def test_director_approval
    [4, 5].each do |days|
      # Arrange
      request = LeaveRequest.new(days: days)

      # Act
      result = @manager.handle(leave_request: request)

      # Assert
      assert_equal "Director approved #{days}-day leave.", result
    end
  end

  # def test_ceo_approval
  #   # Arrange
  #   request = LeaveRequest.new(10)
  #
  #   # Act
  #   result = @manager.handle(request)
  #
  #   # Assert
  #   assert_equal "CEO approved 10-day leave.", result
  # end
end
