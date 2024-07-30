require 'minitest/autorun'
require_relative 'logic'

class TestLogic < Minitest::Test
  # Q001: haskell の zip と同様の機能の関数 my-zip を書け （パラメータの数は可変であること）
  # zip :: [a] -> [b] -> [(a, b)]
  # not using recursion
  def test_my_zip
    assert_equal [[1, 'a', 'x'], [2, 'b', 'y']], my_zip([1, 2], ['a', 'b'], ['x', 'y'])
    assert_equal [[1, 'x']], my_zip([1, 2], ['x'])
    assert_equal [[1, 'x']], my_zip([1], ['x', 'y'])
    assert_equal nil, my_zip()
    assert_equal [], my_zip([])
    assert_equal [], my_zip([], [1])
    assert_equal [], my_zip([1], [])
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
