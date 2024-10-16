# frozen_string_literal: true

require "test_helper"

class TestLittleRubyist < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LittleRubyist::VERSION
  end

  def test_my_zip
    assert_equal [[1, "a", "x"], [2, "b", "y"]], [1, 2].my_zip(%w[a b], %w[x y])
    assert_equal [[1, "x"]], [1, 2].my_zip(["x"])
    assert_equal [[1, "x"]], [1].my_zip(%w[x y])
    assert_equal [], [].my_zip([])
    assert_equal [], [].my_zip([1])
    assert_equal [], [1].my_zip([])
  end

  def test_my_sum
    assert_equal 1, [1].my_sum
    assert_equal 3, [1, 2].my_sum
    assert_equal 0, [].my_sum
  end

  def test_my_quick_sort
    assert_equal [1, 2, 3], [3, 2, 1].my_quick_sort
    assert_equal [1, 2, 3], [2, 3, 1].my_quick_sort
    assert_equal [1, 2, 3], [1, 2, 3].my_quick_sort
    assert_equal [1, 2, 3, 3], [3, 2, 3, 1].my_quick_sort
    assert_equal %w[a b c], %w[c b a].my_quick_sort
    assert_equal %w[a b c], %w[b c a].my_quick_sort
    assert_equal %w[a b c], %w[a b c].my_quick_sort
    assert_equal [1], [1].my_quick_sort
    assert_equal %w[a], %w[a].my_quick_sort
    assert_equal [], [].my_quick_sort
  end

  def test_product
    assert_equal 6, [1, 2, 3].product
    assert_equal 1, [1].product
    assert_equal 1, [].product
  end

  def test_rqsort
    assert_equal [3, 2, 1], [3, 2, 1].rqsort
    assert_equal [3, 2, 1], [2, 3, 1].rqsort
    assert_equal [3, 2, 1], [1, 2, 3].rqsort
    assert_equal [1], [1].rqsort
    assert_equal [], [].rqsort
  end

  def test_my_last
    # (is (=  3 (my-last [1 2 3])))
    # (is (=  2 (my-last [1 2])))
    # (is (=  1 (my-last [1])))
    # (is (thrown? java.util.NoSuchElementException (my-last [])))
    assert_equal 3, [1, 2, 3].my_last
    assert_equal 2, [1, 2].my_last
    assert_equal 1, [1].my_last
    assert_raises StopIteration do
      [].my_last
    end
  end

  def test_halve
    assert_equal [[1], [2]], [1, 2].halve
    assert_equal [[1, 2], [3, 4]], [1, 2, 3, 4].halve
    assert_raises ArgumentError do
      [].halve
    end
    assert_raises ArgumentError do
      [1].halve
    end
    assert_raises ArgumentError do
      [1, 2, 3].halve
    end
  end
end
