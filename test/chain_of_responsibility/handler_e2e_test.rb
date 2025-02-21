require_relative "../test_helper"
require_relative "../../lib/chain_of_responsibility/numeric_handler"
require_relative "../../lib/chain_of_responsibility/string_handler"

# あるリクエストを、特定の順序で複数のハンドラが段階的に処理していく必要がある
class TestChainOfResponsibility < Minitest::Test
  def setup
    @numeric_handler = NumericHandler.new
    @string_handler = StringHandler.new

    @numeric_handler.set_next_handler(handler: @string_handler)
  end

  def test_both_number_and_text
    request = { number: 1, text: "hello" }
    updated_request = @numeric_handler.handle(request: request)

    assert_equal 2, updated_request[:number]
    assert_equal "HELLO", updated_request[:text]
  end

  def test_only_number
    request = { number: 10 }
    updated_request = @numeric_handler.handle(request: request)

    assert_equal 11, updated_request[:number]
  end

  def test_only_text
    request = { text: "abc" }
    updated_request = @numeric_handler.handle(request: request)

    assert_equal "ABC", updated_request[:text]
  end

  def test_empty_request
    request = {}
    updated_request = @numeric_handler.handle(request: request)

    assert_equal({}, updated_request)
  end
end
