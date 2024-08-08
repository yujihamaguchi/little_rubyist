require 'minitest/autorun'
require_relative 'logic'

class TestLogic < Minitest::Test
  def test_my_zip
    assert_equal [[1, 'a', 'x'], [2, 'b', 'y']], [1, 2].my_zip(['a', 'b'], ['x', 'y'])
    # assert_equal [[1, 'x']], [1, 2].my_zip(['x'])
    # assert_equal [[1, 'x']], [1].my_zip(['x', 'y'])
    # assert_equal [], [].my_zip([])
    # assert_equal [], [].my_zip([1])
    # assert_equal [], [1].my_zip([])
  end

  def test_fizzbuzz
    assert_equal '1', fizzbuzz(1)
    assert_equal '2', fizzbuzz(2)
    assert_equal 'Fizz', fizzbuzz(3)
    assert_equal 'Buzz', fizzbuzz(5)
    assert_equal 'Fizz', fizzbuzz(6)
    assert_equal 'FizzBuzz', fizzbuzz(15)
  end
end
