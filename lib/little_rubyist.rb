# frozen_string_literal: true

# noinspection SpellCheckingInspection
require_relative "little_rubyist/version"

# Q001: haskell の zip と同様の機能の関数 my_zip を書け （パラメータの数は可変であること）
# zip :: [a] -> [b] -> [(a, b)]
class Array
  # not using recursion
  def my_zip(*lists)
    return self if lists.empty?

    lists.unshift(self)
    # noinspection RubyNilAnalysis
    length = lists.min_by(&:length).length
    lists.map { |list| list.take(length) }.transpose
  end

  # using recursion
  # def my_zip(*lists)
  #   return [] if self.empty? || lists.any?(&:empty?)
  #
  #   self.drop(1).my_zip(*lists.map { |list| list.drop(1) })
  #       .prepend(lists.map(&:first).prepend(self.first))
  # end
end

# Q002: haskell の sum と同様の機能の関数 my_sum を書け。(再帰を用いるパターン, reduce を用いるパターン)
# sum :: (Num a) => [a] -> a
# sum ns
#     数値のリスト ns の総和を返す。
#     see also: product, foldl
#         sum [1, 2, 3]  = 6
#         sum []         = 0
class Array
  # recursion
  def my_sum
    return 0 if self.empty?

    self.first + self.drop(1).my_sum
  end

  # # reduce
  # def my_sum
  #   self.reduce(0) { |acc, n| acc + n }
  # end
end

# Q003: クイックソート関数 my_quick_sort を書け（リスト内包表記を使うこと）
class Array
  def my_quick_sort
    return [] if self.empty?

    x = self.first
    xs = self.drop(1)

    lt = xs.select { |y| x > y }
    ge = xs.select { |y| x <= y }

    lt.my_quick_sort + [x] + ge.my_quick_sort
  end
end

# Q004: Haskell の product と同様の機能の関数を書け(再帰を用いるパターン、 reduce を用いるパターン)
# product :: (Num a) => [a] -> a
# product ns
#     数値のリスト ns の全要素の積を返す。
#         product [2, 3, 4]   = 24
#         product [4, 5, 0]   = 0
#         product []          = 1
class Array
  # recursion
  def product
    return 1 if self.empty?

    self.first * self.drop(1).product
  end

  # # reduce
  # def product
  #   self.reduce(1) { |acc, n| acc * n }
  # end
end

# Q005: リストを逆順に整列する関数 rqsort を再帰を用いて書け
class Array
  def rqsort
    return [] if self.empty?

    x = self.first
    xs = self.drop(1)
    lt = xs.select { |x_| x_ < x }
    ge = xs.select { |x_| x_ >= x }
    ge.rqsort + [x] + lt.rqsort
  end
end

# Q007: Haskell の last と同様の機能の関数 my-last を書け(再帰を用いるバージョンも書くこと)
# last :: [a] -> a
#     リストの最後の要素を返す。
#         last [1,2,3]   = 3
#         last []        = エラー
class Array
  def my_last
    raise StopIteration if self.empty?

    self.reverse.first
  end

  # # recursion
  # def my_last
  #   raise StopIteration if self.empty?
  #   return self.first if self.length == 1
  #   self.drop(1).my_last
  # end
end

# Q008: 偶数の長さを持つリストを半分ずつに分割する関数 halve を書け。
class Array
  def halve
    raise ArgumentError if self.empty?
    raise ArgumentError if self.length.odd?

    halve_length = self.length / 2
    [self.take(halve_length), self.drop(halve_length)]
  end
end

#  Q009: my-concat を書け。
#  concat :: [[a]] -> [a]
#  concat xs
#      リストのリスト xs を一つのリストに連結する。
#          concat [[1,2], [3,4], [5,6]]    = [1,2,3,4,5,6]
#          concat ["ab", "cd", "ef"]       = "abcdef"
#          concat [[]]                     = []
#          concat []                       = []
class Array
  def my_concat
    self.reduce([]) { |acc, x| acc + x }
  end

  # # recursion
  # def my_concat
  #   return [] if self.empty?
  #
  #   self.first + self.drop(1).my_concat
  # end
end

# Q010: 正の整数に対し、すべての約数を計算する関数 my-factors を書け
class Integer
  def my_factors
    (1..self).select { |divisor| (self % divisor).zero? }
  end
end

# Q011: 対( pair )のリストを検索キーで探索し、対応する値を取り出してリストにする関数 my-find を書け。
class Array
  def my_find(key)
    self.map { |k, v| v if key == k }.compact
  end
end

# Q012: 対のリストから、対の先頭の要素を取り出してリストを生成する firsts を書け。
class Array
  def firsts
    self.map { |item| item[0] }
  end
end

# Q013: haskell の length を、 sum とリスト内包表記で書け。
# length :: [a] -> Int
# length xs
#     リスト xs の長さを返す。
#         length [1,2,3]   = 3
#         length "abcde"   = 5
#         length []        = 0
#         length ""        = 0
module Enumerable
  def my_length
    self.reduce(0) { |acc, _| acc + 1 }
  end
end

class String
  def my_length
    self.chars.my_length
  end
end

# Q014: my-factors を用いて、整数が素数か判定する関数 prime? を書け。
class Integer
  def prime?
    return false if self == 1

    self.my_factors == [1, self]
  end
end

# Q015: prime? を用いて与えられた上限数までの全ての素数を生成する関数 primes を書け。
def primes(max)
  (1..max).select(&:prime?)
end

# Q016: リストから隣り合う要素をマップにして返す関数 pairs を Enumerable#each_cons を用いて書け。
class Array
  def pairs
    self.each_cons(2).to_h
  end
end

class String
  def pairs
    self.chars.pairs
  end
end

# Q018: 目的とする値がリストのどの位置にあるかを調べて、その位置全てをリストとして返す関数 positions を書け。(index は 0 から開始される事)
class Array
  def positions(target_value)
    self.each_index.select { |i| self[i] == target_value }
  end
end

# Q019: 指定した特定の文字がいくつ含まれているか数える関数 my_count を書け。
class String
  def my_count(target_char)
    self.chars.select { |c| target_char == c }.length
  end
end
