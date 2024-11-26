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

  def test_concat
    assert_equal [1, 2, 3, 4], [[1, 2], [3, 4]].my_concat
    assert_equal [1, 2, 3], [[1, 2], [3]].my_concat
    assert_equal [1, 2], [[1, 2]].my_concat
    assert_equal [], [].my_concat
  end

  def test_my_factors
    assert_equal [1, 2, 5, 10], my_factors(10)
    assert_equal [1, 5], my_factors(5)
    assert_equal [1], my_factors(1)
    assert_equal [], my_factors(0)
  end

  def test_myfind
    assert_equal [], [[1, "a"], [2, "b"]].my_find(4)
    assert_equal ["a"], [[1, "a"], [2, "b"]].my_find(1)
    assert_equal ["a"], [[2, "b"], [1, "a"]].my_find(1)
    assert_equal ["a"], [[2, "b"], [1, "a"], [3, "c"]].my_find(1)
    assert_equal %w[a b], [[1, "a"], [1, "b"], [3, "c"]].my_find(1)
    assert_equal [1], [["a", 1], ["b", 2], ["c", 3]].my_find("a")
    assert_equal [1], [["abc", 1], ["def", 2]].my_find("abc")
  end

  def test_firsts
    assert_equal [1], [[1]].firsts
    assert_equal [1], [[1, 2]].firsts
    assert_equal [1], [[1, 2, 3]].firsts
    assert_equal [1, 2], [[1], [2]].firsts
    assert_equal [1, 3], [[1, 2], [3, 4]].firsts
    assert_equal [1, 4], [[1, 2, 3], [4, 5, 6]].firsts
    assert_equal %w[a d], %w[abc def].firsts
  end
end
