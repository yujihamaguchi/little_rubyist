require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/manager"
require_relative "../../lib/chain_of_responsibility/director"
require_relative "../../lib/chain_of_responsibility/ceo"

# どのハンドラがリクエストを処理するかを送信元に意識させずに、複数のハンドラが必要に応じて段階的に処理を委譲できる仕組みを作りたい
class HandlerE2eTest
  def setup
    @manager = Manager.new
    @director = Director.new
    @ceo = CEO.new

    @manager.next_handler = @director
    @director.next_handler = @ceo
  end

  def test_manager_approval
    # Arrange
    request = LeaveRequest.new(3)

    # Act
    result = @manager.handle(request)

    # Assert
    assert_equal "Manager approved 3-day leave.", result
  end

  def test_director_approval
    # Arrange
    request = LeaveRequest.new(5)

    # Act
    result = @manager.handle(request)

    # Assert
    assert_equal "Director approved 5-day leave.", result
  end

  def test_ceo_approval
    # Arrange
    request = LeaveRequest.new(10)

    # Act
    result = @manager.handle(request)

    # Assert
    assert_equal "CEO approved 10-day leave.", result
  end
end
