# test_handler.rb

require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/numeric_handler"
require_relative "../../lib/chain_of_responsibility/string_handler"

class TestChainOfResponsibility < Minitest::Test
  def setup
    @numeric_handler = NumericHandler.new
    @string_handler = StringHandler.new

    @numeric_handler.set_next_handler(handler: @string_handler)
  end

  def test_numeric_request
    num = 1
    result = @numeric_handler.handle(request: num)
    assert_equal "Handled by NumericHandler: #{num}", result
  end

  def test_string_request
    str = "Hello"
    result = @numeric_handler.handle(request: str)
    assert_equal "Handled by StringHandler: #{str}", result
  end

  def test_unhandled_request
    arr = [1, 2, 3]
    result = @numeric_handler.handle(request: arr)
    assert_nil result
  end
end
