# frozen_string_literal: true

require "test_helper"

class TestLittleRubyist < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LittleRubyist::VERSION
  end

  def test_my_zip
    assert_equal [[1, 'a', 'x'], [2, 'b', 'y']], [1, 2].my_zip(['a', 'b'], ['x', 'y'])
    assert_equal [[1, 'x']], [1, 2].my_zip(['x'])
    assert_equal [[1, 'x']], [1].my_zip(['x', 'y'])
    assert_equal [], [].my_zip([])
    assert_equal [], [].my_zip([1])
    assert_equal [], [1].my_zip([])
  end

end
