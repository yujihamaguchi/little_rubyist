# frozen_string_literal: true

require_relative "test_helper"

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
    assert_equal [1, 2, 5, 10], 10.my_factors
    assert_equal [1, 5], 5.my_factors
    assert_equal [1], 1.my_factors
    assert_equal [], 0.my_factors
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

  def test_my_length
    assert_equal 0, [].my_length
    assert_equal 1, [1].my_length
    assert_equal 2, [1, 2].my_length
    assert_equal 3, "abc".my_length
    assert_equal 3, [1, 2, 3].to_set.my_length
    assert_equal 3, { a: 1, b: 2, c: 3 }.my_length
  end

  def test_prime?
    assert_equal false, 1.prime?
    assert_equal true, 2.prime?
    assert_equal true, 3.prime?
    assert_equal false, 4.prime?
    assert_equal true, 5.prime?
    assert_equal false, 6.prime?
  end

  def test_prime
    assert_equal [], primes(1)
    assert_equal [2, 3, 5], primes(5)
  end

  def test_pairs
    assert_equal({ 1 => 2 }, [1, 2].pairs)
    assert_equal({ 1 => 2, 2 => 3 }, [1, 2, 3].pairs)
    assert_equal({ 1 => 2, 2 => 3, 3 => 4 }, [1, 2, 3, 4].pairs)
    assert_equal({}, [1].pairs)
    assert_equal({}, [].pairs)
    assert_equal({}, [].pairs)
    assert_equal({ "a" => "b", "b" => "c" }, "abc".pairs)
  end

  def test_positions
    assert_equal [], [2, 3].positions(1)
    assert_equal [0], [1, 2].positions(1)
    assert_equal [0, 2], [1, 2, 1].positions(1)
    assert_equal [1, 2], [0, 1, 1, 2].positions(1)
  end

  def test_my_count
    assert_equal 1, "abc".my_count("a")
    assert_equal 1, "abc".my_count("b")
    assert_equal 1, "abc".my_count("c")
    assert_equal 0, "abc".my_count("d")
    assert_equal 2, "abca".my_count("a")
    assert_equal 3, "abaca".my_count("a")
  end

  def test_lower_count
    assert_equal 3, "abcあ亜ア".lower_count
    assert_equal 2, "あ亜アAbc".lower_count
    assert_equal 2, "aBcあ亜ア".lower_count
    assert_equal 2, "あ亜アabC".lower_count
  end

  def test_perfects
    assert_equal [6], 10.perfects
    assert_equal [6, 28], 100.perfects
    assert_equal [], 0.perfects
    assert_equal [], 1.perfects
  end

  def test_pyths
    assert_equal [[3, 4, 5], [6, 8, 10]], 10.pyths
  end

  def test_my_replicate
    assert_equal [], true.my_replicate(0)
    assert_equal [true], true.my_replicate(1)
    assert_equal [true, true], true.my_replicate(2)
    assert_equal [1, 1], 1.my_replicate(2)
    assert_equal %w[a a], "a".my_replicate(2)
  end

  def test_scalar_product
    assert_equal 32, [1, 2, 3].scalar_product([4, 5, 6])
    assert_equal 0, [].scalar_product([])
  end

  def test_my_reverse
    assert_equal [], [].my_reverse
    assert_equal [1], [1].my_reverse
    assert_equal [2, 1], [1, 2].my_reverse
    assert_equal [1, 2, 3], [3, 2, 1].my_reverse
    assert_equal [3, 2, 1], [1, 2, 3].my_reverse
  end

  def test_my_insert
    assert_equal [1, 2, 3], [1, 3].my_insert(2)
    assert_equal [1, 2, 3], [2, 3].my_insert(1)
    assert_equal [1, 2, 3], [1, 2].my_insert(3)
    assert_equal [1], [].my_insert(1)
  end

  def test_isort
    assert_equal [], [].isort
    assert_equal [1], [1].isort
    assert_equal [1, 2], [1, 2].isort
    assert_equal [1, 2], [2, 1].isort
    assert_equal [1, 2, 3], [1, 2, 3].isort
    assert_equal [1, 2, 3], [1, 3, 2].isort
    assert_equal [1, 2, 3], [2, 3, 1].isort
    assert_equal [1, 2, 3], [2, 1, 3].isort
    assert_equal [1, 2, 3], [3, 1, 2].isort
    assert_equal [1, 2, 3], [3, 2, 1].isort
  end

  def test_my_drop
    assert_equal [], [].my_drop(1)
    assert_equal [1, 2, 3], [1, 2, 3].my_drop(0)
    assert_equal [2, 3], [1, 2, 3].my_drop(1)
    assert_equal [3], [1, 2, 3].my_drop(2)
    assert_equal [], [1, 2, 3].my_drop(3)
    assert_equal [], [1, 2, 3].my_drop(4)
  end

  def test_my_zip_2
    assert_equal [], [].my_zip_2([4, 5, 6])
    assert_equal [], [1, 2, 3].my_zip_2([])
    assert_equal [[1, 4], [2, 5], [3, 6]], [1, 2, 3].my_zip_2([4, 5, 6])
    assert_equal [[1, 4], [2, 5]], [1, 2, 3].my_zip_2([4, 5])
    assert_equal [[1, 4], [2, 5]], [1, 2].my_zip_2([4, 5, 6])
  end

  def test_my_even?
    assert 0.my_even?
    refute 1.my_even?
    assert 2.my_even?
    refute 3.my_even?
    refute(-1.my_even?)
    assert(-2.my_even?)
    refute(-3.my_even?)
  end

  def test_my_odd?
    refute 0.my_odd?
    assert 1.my_odd?
    refute 2.my_odd?
    assert 3.my_odd?
    assert(-1.my_odd?)
    refute(-2.my_odd?)
    assert(-3.my_odd?)
  end

  def test_fibonacci
    assert_equal 0, 0.fibonacci
    assert_equal 1, 1.fibonacci
    assert_equal 1, 2.fibonacci
    assert_equal 2, 3.fibonacci
    assert_equal 3, 4.fibonacci
  end

  def test_qsort
    assert_equal [], [].qsort
    assert_equal [1], [1].qsort
    assert_equal [1, 2, 3], [1, 2, 3].qsort
    assert_equal [1, 2, 3], [3, 1, 2].qsort
    assert_equal [1, 2, 3], [2, 3, 1].qsort
    assert_equal [1, 2, 2, 3], [2, 3, 2, 1].qsort
  end

  def test_evens
    assert_equal [], [].evens
    assert_equal [], [1].evens
    assert_equal [2], [1, 2].evens
    assert_equal [2], [1, 2, 3].evens
    assert_equal [2, 4], [1, 2, 3, 4].evens
  end

  def test_odds
    assert_equal [], [].odds
    assert_equal [1], [1].odds
    assert_equal [1], [1, 2].odds
    assert_equal [1, 3], [1, 2, 3].odds
    assert_equal [1, 3], [1, 2, 3, 4].odds
  end

  def test_my_init
    assert_equal [], [].my_init
    assert_equal [], [1].my_init
    assert_equal [1], [1, 2].my_init
    assert_equal [1, 2], [1, 2, 3].my_init
  end
end
