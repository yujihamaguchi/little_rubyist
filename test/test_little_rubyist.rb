# frozen_string_literal: true

require_relative "test_helper"
require "bmg"

class TestLittleRubyist < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LittleRubyist::VERSION
  end

  def test_my_zip
    assert_equal [], [].my_zip([])
    assert_equal [], [].my_zip([1])
    assert_equal [], [1].my_zip([], [1])
    assert_equal [], [1].my_zip([1], [])
    assert_equal [[1, "a", "x"], [2, "b", "y"]], [1, 2].my_zip(%w[a b], %w[x y])
    assert_equal [[1, "x"]], [1, 2].my_zip(["x"])
    assert_equal [[1, "x"]], [1].my_zip(%w[x y])
  end

  def test_my_sum
    assert_equal 0, [].my_sum
    assert_equal 1, [1].my_sum
    assert_equal 3, [1, 2].my_sum
  end

  def test_my_quick_sort
    assert_equal [], [].my_quick_sort
    assert_equal [1], [1].my_quick_sort
    assert_equal %w[a], %w[a].my_quick_sort
    assert_equal [1, 2, 3], [3, 2, 1].my_quick_sort
    assert_equal [1, 2, 3], [2, 3, 1].my_quick_sort
    assert_equal [1, 2, 3], [1, 2, 3].my_quick_sort
    assert_equal [1, 2, 3, 3], [3, 2, 3, 1].my_quick_sort
    assert_equal %w[a b c], %w[c b a].my_quick_sort
    assert_equal %w[a b c], %w[b c a].my_quick_sort
    assert_equal %w[a b c], %w[a b c].my_quick_sort
  end

  def test_product
    assert_equal 1, [].my_product
    assert_equal 1, [1].my_product
    assert_equal 6, [1, 2, 3].my_product
  end

  def test_rqsort
    assert_equal [], [].reverse_quick_sort
    assert_equal [1], [1].reverse_quick_sort
    assert_equal [3, 2, 1], [1, 2, 3].reverse_quick_sort
    assert_equal [3, 2, 1], [2, 3, 1].reverse_quick_sort
    assert_equal [3, 2, 1], [3, 2, 1].reverse_quick_sort
    assert_equal [3, 2, 2, 1], [1, 2, 2, 3].reverse_quick_sort
    assert_equal [1, 0, -1], [-1, 0, 1].reverse_quick_sort
  end

  def test_my_last
    assert_raises StopIteration do
      [].my_last
    end
    assert_equal 1, [1].my_last
    assert_equal 2, [1, 2].my_last
    assert_equal 3, [1, 2, 3].my_last
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
    assert_equal [], [].my_concat
    assert_equal [], [[]].my_concat
    assert_equal [1, 2], [[1, 2]].my_concat
    assert_equal [1, 2], [[], [1, 2]].my_concat
    assert_equal [1, 2], [[1, 2], []].my_concat
    assert_equal [1, 2, 3], [[1, 2], [3]].my_concat
    assert_equal [1, 2, 3], [[1], [2, 3]].my_concat
    assert_equal [1, 2, 3, 4], [[1, 2], [3, 4]].my_concat
  end

  def test_my_factors
    assert_equal [1], 1.my_factors
    assert_equal [1, 2], 2.my_factors
    assert_equal [1, 3], 3.my_factors
    assert_equal [1, 2, 4], 4.my_factors
  end

  def test_my_select
    assert_equal [], [].my_select("foo")
    assert_equal [], [[1, :a], [2, :b]].my_select(3)
    assert_equal [:a], [[1, :a], [2, :b]].my_select(1)
    assert_equal [:a], [[2, :b], [1, :a]].my_select(1)
    assert_equal [:a], [[2, :b], [1, :a], [3, :c]].my_select(1)
    assert_equal %i[a b], [[1, :a], [1, :b], [3, :c]].my_select(1)
    assert_equal [1], [[:a, 1]].my_select(:a)
  end

  def test_firsts
    assert_equal [], [].firsts
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
    assert_equal 3, [1, 2, 3].to_set.my_length
    assert_equal 3, { a: 1, b: 2, c: 3 }.my_length
    assert_equal 3, "abc".my_length
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
    assert_equal [], primes_by(1)
    assert_equal [2, 3, 5], primes_by(5)
  end

  def test_pairs
    assert_equal({}, [].pairs)
    assert_equal({}, [1].pairs)
    assert_equal({ 1 => 2 }, [1, 2].pairs)
    assert_equal({ 1 => 2, 2 => 3 }, [1, 2, 3].pairs)
    assert_equal({ 1 => 2, 2 => 3, 3 => 4 }, [1, 2, 3, 4].pairs)
    assert_equal({ "a" => "b", "b" => "c" }, "abc".pairs)
  end

  def test_positions
    assert_equal [], [].positions(1)
    assert_equal [], [2, 3].positions(1)
    assert_equal [0], [1, 2].positions(1)
    assert_equal [0, 2], [1, 2, 1].positions(1)
    assert_equal [1, 2], [0, 1, 1, 2].positions(1)
  end

  def test_my_count
    assert_equal 0, "".my_count("a")
    assert_raises(ArgumentError) do
      "abc".my_count("")
    end
    assert_raises(ArgumentError) do
      "abc".my_count("ab")
    end
    assert_equal 0, "abc".my_count("d")
    assert_equal 1, "abc".my_count("a")
    assert_equal 1, "abc".my_count("b")
    assert_equal 1, "abc".my_count("c")
    assert_equal 2, "abca".my_count("a")
    assert_equal 3, "abaca".my_count("a")
  end

  def test_lower_count
    assert_equal 0, "".lower_count
    assert_equal 0, "A".lower_count
    assert_equal 1, "a".lower_count
    assert_equal 3, "abcあ亜ア".lower_count
    assert_equal 2, "あ亜アAbc".lower_count
    assert_equal 2, "aBcあ亜ア".lower_count
    assert_equal 2, "あ亜アabC".lower_count
  end

  def test_perfects
    assert_equal [], 0.perfects
    assert_equal [], 1.perfects
    assert_equal [6], 10.perfects
    assert_equal [6, 28], 100.perfects
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
    assert_equal 0, [].scalar_product([])
    assert_equal 32, [1, 2, 3].scalar_product([4, 5, 6])
  end

  def test_my_reverse
    assert_equal [], [].my_reverse
    assert_equal [1], [1].my_reverse
    assert_equal [2, 1], [1, 2].my_reverse
    assert_equal [1, 2, 3], [3, 2, 1].my_reverse
    assert_equal [3, 2, 1], [1, 2, 3].my_reverse
  end

  def test_my_insert
    assert_equal [], [].my_insert
    assert_equal [1], [1].my_insert
    assert_equal [1], [].my_insert(1)
    assert_equal [1, 2], [1].my_insert(2)
    assert_equal [1, 2, 3], [1, 3].my_insert(2)
    assert_equal [1, 2, 3], [2, 3].my_insert(1)
    assert_equal [1, 2, 3], [1, 2].my_insert(3)
    assert_equal [1, 1, 2, 3, 3], [1, 1, 3, 3].my_insert(2)
  end

  def test_sort_by_insertion
    assert_equal [], [].sort_by_insertion
    assert_equal [1], [1].sort_by_insertion
    assert_equal [1, 2], [1, 2].sort_by_insertion
    assert_equal [1, 2], [2, 1].sort_by_insertion
    assert_equal [1, 2, 3], [1, 2, 3].sort_by_insertion
    assert_equal [1, 2, 3], [1, 3, 2].sort_by_insertion
    assert_equal [1, 2, 3], [2, 3, 1].sort_by_insertion
    assert_equal [1, 2, 3], [2, 1, 3].sort_by_insertion
    assert_equal [1, 2, 3], [3, 1, 2].sort_by_insertion
    assert_equal [1, 2, 3], [3, 2, 1].sort_by_insertion
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

  def test_my_elem
    refute 1.my_elem([])
    assert 1.my_elem([1])
    refute 2.my_elem([1])
    assert 2.my_elem([1, 2])
    assert 2.my_elem([1, 2, 3])
  end

  def test_my_index
    assert_nil [].my_index(0)
    assert_nil [1].my_index(1)
    assert_equal 1, [1].my_index(0)
    assert_equal 2, [1, 2].my_index(1)
  end

  def test_my_merge
    assert_equal [], [].my_merge([])
    assert_equal [1, 2], [].my_merge([1, 2])
    assert_equal [1, 2], [1, 2].my_merge([])
    assert_equal [1, 2, 3, 4, 5, 6], [2, 5, 6].my_merge([1, 3, 4])
    assert_equal [0, 1, 1, 1, 2, 2, 2, 3], [0, 1, 1, 2].my_merge([1, 2, 2, 3])
  end

  def test_msort
    assert_equal [], [].msort
    assert_equal [1], [1].msort
    assert_equal [1, 2], [1, 2].msort
    assert_equal [1, 2], [2, 1].msort
    assert_equal [1, 2, 3], [1, 3, 2].msort
  end

  def test_my_replicate_rec
    assert_equal [], "a".my_replicate_rec(0)
    assert_equal ["a"], "a".my_replicate_rec(1)
    assert_equal %w[a a], "a".my_replicate_rec(2)
  end

  def test_my
    assert_equal 1, 0.my(0)
    assert_equal 1, 1.my(0)
    assert_equal 1, 1.my(1)
    assert_equal 2, 2.my(1)
    assert_equal 4, 2.my(2)
    assert_equal 8, 2.my(3)
  end

  def test_my_map
    assert_equal [], [].my_map(->(n) { n })
    assert_equal [1], [1].my_map(->(n) { n })
    assert_equal [2], [1].my_map(->(n) { n + 1 })
    assert_equal [2, 3], [1, 2].my_map(->(n) { n + 1 })
  end

  def test_my_filter
    assert_equal [], [].my_filter(lambda(&:odd?))
    assert_equal [1], [1].my_filter(lambda(&:odd?))
    assert_equal [], [2].my_filter(lambda(&:odd?))
    assert_equal [1], [1, 2].my_filter(lambda(&:odd?))
    assert_equal [3], [2, 3].my_filter(lambda(&:odd?))
    assert_equal [1, 3], [1, 2, 3].my_filter(lambda(&:odd?))
  end

  def test_my_drop_while
    assert_equal [], [].my_drop_while(->(_) {})
    assert_equal [], [1].my_drop_while(lambda(&:odd?))
    assert_equal [2], [2].my_drop_while(lambda(&:odd?))
    assert_equal [2], [1, 2].my_drop_while(lambda(&:odd?))
    assert_equal [], [1, 3].my_drop_while(lambda(&:odd?))
    assert_equal [2, 3], [1, 2, 3].my_drop_while(lambda(&:odd?))
  end

  def test_my_take_while
    assert_equal [], [].my_take_while(lambda(&:odd?))
    assert_equal [1], [1].my_take_while(lambda(&:odd?))
    assert_equal [], [2].my_take_while(lambda(&:odd?))
    assert_equal [1], [1, 2].my_take_while(lambda(&:odd?))
    assert_equal [1], [1, 2, 3].my_take_while(lambda(&:odd?))
    assert_equal [1, 3], [1, 3, 4].my_take_while(lambda(&:odd?))
  end

  def test_my_foldr
    assert_equal 10, [1, 2, 3].my_foldr(->(n, m) { n + m }, 4)
    assert_equal "abc", %w[a b].my_foldr(->(c1, c2) { c1 + c2 }, "c")
  end

  def test_my_foldl
    assert_equal 10, [1, 2, 3].my_foldl(->(n, m) { n + m }, 4)
    assert_equal "cab", %w[a b].my_foldl(->(c1, c2) { c1 + c2 }, "c")
  end

  TEST_CASES_FOR_BITS_TO_INT = [
    { exp: 0, arg: [0] },
    { exp: 1, arg: [1] },
    { exp: 2, arg: [0, 1] },
    { exp: 3, arg: [1, 1] },
    { exp: 4, arg: [0, 0, 1] },
    { exp: 5, arg: [1, 0, 1] },
    { exp: 6, arg: [0, 1, 1] },
    { exp: 7, arg: [1, 1, 1] },
    { exp: 8, arg: [0, 0, 0, 1] },
    { exp: 9, arg: [1, 0, 0, 1] }
  ].freeze

  def test_bits_to_int
    TEST_CASES_FOR_BITS_TO_INT.each do |test_case|
      assert_equal test_case[:exp], test_case[:arg].bits_to_int
    end
  end

  TEST_CASES_FOR_INT_TO_BITS = [
    { exp: [1], arg: 1 },
    { exp: [0, 1], arg: 2 },
    { exp: [1, 1], arg: 3 },
    { exp: [0, 0, 1], arg: 4 },
    { exp: [1, 0, 1], arg: 5 },
    { exp: [0, 1, 1], arg: 6 },
    { exp: [1, 1, 1], arg: 7 },
    { exp: [0, 0, 0, 1], arg: 8 },
    { exp: [1, 0, 0, 1], arg: 9 },
    { exp: [0, 1, 0, 1], arg: 10 },
    { exp: [1, 1, 0, 1], arg: 11 }
  ].freeze

  def test_int_to_bits
    TEST_CASES_FOR_INT_TO_BITS.each do |test_case|
      assert_equal test_case[:exp], test_case[:arg].int_to_bits
    end
  end

  def test_make8
    assert_equal [1, 0, 0, 0, 0, 0, 0, 0], [1].make8
    assert_equal [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0].make8
    assert_equal [1, 0, 1, 0, 0, 0, 0, 0], [1, 0, 1, 0, 0, 0, 0, 0].make8
  end

  def test_chop8
    assert_equal [[1, 0, 0, 0, 0, 0, 0, 0]], [1, 0, 0, 0, 0, 0, 0, 0].chop8
    assert_equal [[1, 0, 0, 0, 0, 0, 0, 0]], [1, 0, 0, 0, 0, 0, 0].chop8
    assert_equal [[1, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]], [1, 0, 0, 0, 0, 0, 0, 0, 0].chop8
    assert_equal [[1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0]], [1, 0, 0, 0, 0, 0, 0, 0, 1].chop8
  end

  def test_decode
    assert_equal "ab", [1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0].decode
    assert_equal "ac", [1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0].decode
  end

  def test_my_encode
    assert_equal [1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0], "ab".my_encode
    assert_equal [1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0], "ac".my_encode
  end

  def test_my_all?
    assert [].my_all?(lambda(&:odd?))
    assert [1, 3, 5].my_all?(lambda(&:odd?))
    refute [2, 3, 5].my_all?(lambda(&:odd?))
    refute [1, 2, 3].my_all?(lambda(&:odd?))
    refute [1, 3, 4].my_all?(lambda(&:odd?))
  end

  def test_my_any?
    refute [].my_any?(lambda(&:odd?))
    assert [1].my_any?(lambda(&:odd?))
    assert [1, 2, 4].my_any?(lambda(&:odd?))
    assert [2, 3, 4].my_any?(lambda(&:odd?))
    assert [2, 4, 5].my_any?(lambda(&:odd?))
    refute [2].my_any?(lambda(&:odd?))
    refute [2, 4].my_any?(lambda(&:odd?))
  end

  def test_set1
    assert_equal Bmg::Relation.new([
                                     { title: "The Art of the Fugue", composer: "J. S. Bach" },
                                     { title: "Requiem", composer: "W. A. Mozart" },
                                     { title: "Requiem", composer: "Giuseppe Verdi" },
                                     { title: "Musical Offering", composer: "J. S. Bach" }
                                   ]).to_set, set1
  end

  def test_set2
    assert_equal Bmg::Relation.new([
                                     { name: "Requiem", composer: "W. A. Mozart" },
                                     { name: "Requiem", composer: "Giuseppe Verdi" }
                                   ]).to_set, set2
  end

  def test_set3
    assert_equal Bmg::Relation.new([
                                     { name: "The Art of the Fugue" },
                                     { name: "Requiem" },
                                     { name: "Musical Offering" }
                                   ]).to_set, set3
  end

  def test_set4
    assert_equal Bmg::Relation.new([
                                     { name: "The Art of the Fugue", composer: "J. S. Bach", country: "Germany" },
                                     { name: "Requiem", composer: "W. A. Mozart", country: "Austria" },
                                     { name: "Requiem", composer: "Giuseppe Verdi", country: "Italy" },
                                     { name: "Musical Offering", composer: "J. S. Bach", country: "Germany" }
                                   ]).to_set, set4
  end

  def test_set5
    assert_equal Bmg::Relation.new([
                                     { country: "Germany", language: "Germany",
                                       composer: "J. S. Bach" },
                                     { country: "Italy", language: "Italian",
                                       composer: "Giuseppe Verdi" },
                                     { country: "Austria", language: "German",
                                       composer: "W. A. Mozart" }
                                   ]).to_set, set5
  end

  def test_set6
    assert_equal Bmg::Relation.new([
                                     { country: "Italy" },
                                     { country: "Austria" }
                                   ]).to_set, set6
  end

  def test_deeply_nested
    assert_equal :bottom, :bottom.deeply_nested(0)
    assert_equal [:bottom], :bottom.deeply_nested(1)
    assert_equal [[:bottom]], :bottom.deeply_nested(2)
  end

  def test_count_heads_pairs
    assert_equal 0, [].count_heads_pairs
    assert_equal 0, [:h].count_heads_pairs
    assert_equal 0, %i[t h].count_heads_pairs
    assert_equal 0, %i[h t].count_heads_pairs
    assert_equal 0, %i[t t].count_heads_pairs
    assert_equal 0, %i[t t t].count_heads_pairs
    assert_equal 0, %i[h t t].count_heads_pairs
    assert_equal 0, %i[t h t].count_heads_pairs
    assert_equal 0, %i[t t h].count_heads_pairs
    assert_equal 1, %i[h h].count_heads_pairs
    assert_equal 2, %i[h h h].count_heads_pairs
    assert_equal 3, %i[h h h h].count_heads_pairs
    assert_equal 2, %i[h h t h h].count_heads_pairs
    assert_equal 3, %i[t h h h h].count_heads_pairs
    assert_equal 3, %i[h h h h t].count_heads_pairs
    assert_equal 2, %i[h h h t h].count_heads_pairs
    assert_equal 2, %i[h t t h h h].count_heads_pairs
  end

  def test_by_pairs
    assert_equal [], [].by_pairs
    assert_equal [], [:t].by_pairs
    assert_equal [%i[t t]], %i[t t].by_pairs
    assert_equal [%i[t t], %i[t t]], %i[t t t].by_pairs
    assert_equal [%i[t t], %i[t t], %i[t t]], %i[t t t t].by_pairs
    assert_equal [%i[h t], %i[t t], %i[t h], %i[h h], %i[h h]], %i[h t t h h h].by_pairs
  end

  def test_move_zeros_2_back
    assert_equal [1, 2, 3, 0], [0, 1, 2, 3].move_zeros_2_back
    assert_equal [4, 1, 5, 0, 0], [4, 1, 0, 0, 5].move_zeros_2_back
  end

  def test_unique_attribute
    assert_equal 1, [1].unique_attribute
    assert_equal 1, [1, 2, 2].unique_attribute
    assert_equal 3, [1, 2, 2, 3, 1].unique_attribute
  end

  def test_overlap?
    refute [1, 2].overlap?([3, 4])
    assert [1, 2].overlap?([1, 2])
    assert [1, 2].overlap?([2, 3])
    assert [2, 3].overlap?([1, 2])
    refute [1, 2].overlap?([3, 4])
    refute [3, 4].overlap?([1, 2])
  end

  def test_merge_intervals
    assert_equal [[1, 2], [3, 4]], [[1, 2], [3, 4]].merge_intervals
    assert_equal [[1, 3]], [[1, 2], [2, 3]].merge_intervals
    assert_equal [[1, 2], [3, 4]], [[3, 4], [1, 2]].merge_intervals
    assert_equal [[1, 3]], [[2, 3], [1, 2]].merge_intervals
    assert_equal [[1, 2], [3, 4], [5, 6]], [[1, 2], [3, 4], [5, 6]].merge_intervals
    assert_equal [[1, 3], [4, 5]], [[1, 2], [2, 3], [4, 5]].merge_intervals
    assert_equal [[1, 4]], [[1, 2], [2, 3], [3, 4]].merge_intervals
    assert_equal [[1, 2], [3, 5]], [[1, 2], [3, 4], [4, 5]].merge_intervals
    assert_equal [[1, 3], [4, 5]], [[1, 3], [4, 5], [1, 3]].merge_intervals
    assert_equal [[0, 3], [4, 5]], [[1, 3], [0, 3], [4, 5]].merge_intervals
    assert_equal [[1, 6]], [[1, 6], [2, 5], [3, 4]].merge_intervals
    assert_equal [[1, 3], [4, 6], [7, 9]], [[1, 3], [4, 6], [7, 9]].merge_intervals
  end

  def test_replace_symbol
    assert_equal [], [].replace_symbol(:a, :b)
    assert_equal [:b], [:a].replace_symbol(:a, :b)
    assert_equal %i[b b], %i[a b].replace_symbol(:a, :b)
    assert_equal %i[b b], %i[b a].replace_symbol(:a, :b)
    assert_equal [[:b], :b], [[:a], :b].replace_symbol(:a, :b)
    assert_equal [:b, [:b]], [:b, [:a]].replace_symbol(:a, :b)
    assert_equal [:b, [:b], :b], [:a, [:a], :b].replace_symbol(:a, :b)
    assert_equal [:b, [:b]], [:b, [:a]].replace_symbol(:a, :b)
    assert_equal [[:b], [:b], :b], [[:a], [:a], :b].replace_symbol(:a, :b)
    assert_equal [%i[a a], [[%i[a g r], %i[f r]], :c, %i[d e]], :a],
                 [%i[a b], [[%i[b g r], %i[f r]], :c, %i[d e]], :a].replace_symbol(:b, :a)
    # Ruby では再帰的な書き方では即時評価されてしまい遅延評価を行うことはできないとのこと
    # (is (= (repeat 5 'b) (take 5 (replace-symbol (repeat 'a) 'a 'b)))))
    # assert_equal Array.new(5, :b), Enumerator.new { |y| loop { y < :b } }.replace_symbol(:a, :b)
  end

  def test_make_greeter
    assert_equal "Hello, Yuji", "Hello".make_greeter.call("Yuji")
    assert_equal "Aloha, Yuji", "Aloha".make_greeter.call("Yuji")
  end

  def test_index_filter
    assert_equal [], Set.new(%w[a b]).index_filter("xyz")
    assert_equal [0, 1, 4, 5, 6], Set.new(%w[a b]).index_filter("abcdbbb")
  end

  def test_partition_stride
    assert_equal [], [].partition_stride(1)
    assert_equal [], [0].partition_stride(2)
    assert_equal [[0]], [0].partition_stride(1, 2)
    assert_equal [[0]], [0].partition_stride(0)
    assert_equal [[0]], [0].partition_stride(1, 0)
    assert_equal [[0], [1]], [0, 1].partition_stride(1)
    assert_equal [[0, 1], [2, 3]], [0, 1, 2, 3].partition_stride(2)
    assert_equal [[0, 1, 2]], [0, 1, 2, 3].partition_stride(3)
    assert_equal [[0, 1], [1, 2]], [0, 1, 2].partition_stride(2, 1)
  end

  def test_count_runs
    assert_equal 0, [].count_runs(2, ->(sym) { sym == :h })
    assert_equal 0, %i[h].count_runs(2, ->(sym) { sym == :h })
    assert_equal 1, %i[h h].count_runs(2, ->(sym) { sym == :h })
    assert_equal 2, %i[h h h].count_runs(2, ->(sym) { sym == :h })
    assert_equal 2, %i[t h h h].count_runs(2, ->(sym) { sym == :h })
    assert_equal 2, %i[h h h t].count_runs(2, ->(sym) { sym == :h })
    assert_equal 2, %i[t h h h t].count_runs(2, ->(sym) { sym == :h })
  end

  def test_tree_height
    assert_equal 0, :leaf.tree_height
    assert_equal 1, %i[node leaf leaf].tree_height
    assert_equal 2, [:node, %i[node leaf leaf], :leaf].tree_height
    assert_equal 2, [:node, :leaf, %i[node leaf leaf]].tree_height
    assert_equal 3, [:node, [:node, %i[node leaf leaf], :leaf], :leaf].tree_height
  end

  def test_perfect_squares
    assert_equal [1, 4, 9], 10.perfect_squares
    assert_equal [1, 4, 9, 16, 25], 25.perfect_squares
    assert_equal [1], 3.perfect_squares
    assert_equal [], 0.perfect_squares
  end

  def test_my_rotate
    assert_equal [], [].my_rotate(1)
    assert_equal [1, 2, 3], [1, 2, 3].my_rotate(0)
    assert_equal [2, 3, 1], [1, 2, 3].my_rotate(1)
    assert_equal [3, 1, 2], [1, 2, 3].my_rotate(2)
    assert_equal [1, 2, 3], [1, 2, 3].my_rotate(3)
    assert_equal [2, 3, 1], [1, 2, 3].my_rotate(4)
    assert_equal [3, 1, 2], [1, 2, 3].my_rotate(-1)
  end

  def test_palindrome?
    assert "".palindrome?
    assert "a".palindrome?
    assert "aa".palindrome?
    assert "aba".palindrome?
    assert "abba".palindrome?
    refute "ab".palindrome?
    refute "abc".palindrome?
    refute "abca".palindrome?
  end

  def test_hanoi
    assert_equal [], hanoi(0, :a, :b, :c)
    assert_equal [%i[a b]], hanoi(1, :a, :b, :c)
    assert_equal [%i[a c], %i[a b], %i[c b]], hanoi(2, :a, :b, :c)
    assert_equal 7, hanoi(3, :a, :b, :c).length
    assert_equal 15, hanoi(4, :a, :b, :c).length
  end
end
