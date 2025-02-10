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
  #   self.reduce(0) { |acc, value| acc + value }
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
  #   self.reduce(1) { |acc, value| acc * value }
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
    # self.chars.map { |c| c == target_char ? 1 : 0 }.sum
    # self.chars.map { |c| c == target_char ? 1 : 0 }.reduce(&:+)
  end
end

# Q020: 文字列から小文字を数える関数 lower_count を書け。
class String
  def lower_count
    self.chars.select { |c| /[a-z]/.match?(c) }.length
  end
end

# Q031: 与えられた上限の数値までに含まれる完全数全てを算出する関数 perfects を関数 my_factors および my_sum を使って定義せよ。
#       完全数：自分自身をのぞく約数の和が自分自身と等しい整数
class Integer
  def perfects
    (1..self).select do |n|
      n == n.my_factors[0...-1].my_sum
    end
  end
end

# Q032: ピタゴラス数のリストを生成する関数 pyths を定義せよ。
#       ただし、ピタゴラス数の要素は与えられた上限 value 以下であるとする。
class Integer
  def pyths
    (1..self).to_a.combination(3).select { |x, y, z| x**2 + y**2 == z**2 }
  end
end

# Q033: ある要素のみからなるリストを生成する関数 my_replicate を書け。(直接の再帰、末尾再帰のそれぞれを書け)
# 直接の再帰
class Object
  def my_replicate(num)
    return [] if num.zero?

    self.my_replicate(num - 1) + [self]
  end
end

# 末尾再帰
# class Object
#   def my_replicate(value)
#     my_replicate_ = lambda do |acc, value|
#       return acc if value.zero?
#
#       my_replicate_.call(acc + [self], value - 1)
#     end
#     my_replicate_.call([], value)
#   end
# end

# Q034: 二つの整数のリストの内積を求める関数　scalar_product　を書け。
class Array
  def scalar_product(other)
    # self.zip(other).sum { |value, elem| value * elem }
    self.zip(other).reduce(0) { |acc, (n, m)| acc + n * m }
  end
end

# Q035: リストの順番を逆転する関数 my-reverse を直接の再帰を用いて自作せよ。
class Array
  def my_reverse
    return [] if self.empty?

    self.drop(1).my_reverse + [self.first]
  end
end

# Q036: ある要素を、整列されたリストに挿入する関数 my_insert を書け。( 再帰バージョンも書いてみよう )
class Array
  # def my_insert(value)
  #   self.take_while { |elem| elem < value } + [value] + self.drop_while { |elem| elem < value }
  # end
  def my_insert(value)
    return [value] if self.empty?
    return [value] + self if value <= self.first

    [self.first] + self.drop(1).my_insert(value)
  end
end

# Q037: 関数 my_insert を用いてリストのソートを"挿入ソート"で行う関数　isort　を書け。
class Array
  def isort
    return [] if self.empty?

    self.drop(1).isort.my_insert(self.first)
  end
end

# Q038: drop を再帰を用いて自作( my_drop )せよ。
class Array
  def my_drop(num)
    return [] if self.empty?
    return self if num.zero?

    self[1..].my_drop(num - 1)
  end
end

# Q039: Haskell の zip 関数を直接の再帰を用いて自作( my_zip_2 )せよ。( パターンマッチを用いた書き方も )
#       [a] -> [b] -> [(a,b)]
class Array
  def my_zip_2(other)
    # パターンマッチを使用しない
    return [] if self.empty? || other.empty?

    [[self.first, other.first]] + self.drop(1).my_zip_2(other.drop(1))

    # パターンマッチを使用
    # case [self, other]
    # in [[x, *xs], [y, *ys]]
    #   [[x, y]] + xs.my_zip_2(ys)
    # else
    #   []
    # end
  end
end

# Q040: even と odd を相互再帰を用いて自作( my_even?, my_odd? )せよ。
class Integer
  def my_even?
    self.zero? || (self.abs - 1).my_odd?
  end

  def my_odd?
    !self.zero? && (self.abs - 1).my_even?
  end
end

# Q041: 0 以上の整数 n に対し、 n 番目のフィボナッチ数を求める関数 fibonacci を書け。（直接の再帰を用いて良い）
class Integer
  def fibonacci
    return 0 if self.zero?
    return 1 if self == 1

    (self - 1).fibonacci + (self - 2).fibonacci
  end
end

# Q042: qsort を再帰を用いて書け。（直接の再帰を用いて）
class Array
  def qsort
    return [] if self.empty?

    return self if self.size == 1

    x, *xs = self
    lt = xs.select { |x_| x_ < x }
    ge = xs.select { |x_| x_ >= x }
    lt.qsort + [x] + ge.qsort
  end
end

# Q043: リストから偶数の位置の要素を取り出す関数 evens と、奇数の位置の要素を取り出す関数 odds を相互再帰を用いて書け。
class Array
  def evens
    return [] if self.empty?

    self.drop(1).odds
  end

  def odds
    return [] if self.empty?

    [self.first] + self.drop(1).evens
  end
end

# Q044: Haskell の init 関数を自作( my_init )せよ。(直接の再帰を用いたもの、遅延評価関数を用いたもの両方書くこと）
# init :: [a] -> [a]
# リスト xs の最後の要素を除いたリストを返す。
#     init [1,2,3]   = [1,2]
#     init [1]       = []
class Array
  # 再帰を用いたもの
  def my_init
    return [] if self.size <= 1

    [self.first] + self.drop(1).my_init
  end

  # 遅延評価関数を用いたもの
  # def my_init
  #   self.reverse.drop(1).reverse
  # end
end

# Q045: Haskell の elem を直接の再帰を用いて自作( my_elem )せよ。
#       elem :: Eq a => a -> [a] -> Bool
class Object
  def my_elem(arr)
    return false if arr.empty?

    self == arr.first || self.my_elem(arr.drop(1))
  end
end

# Q046: Haskell の !! を my_index という名のメソッドとして直接の再帰を用いて自作せよ。該当する要素がない場合は nil を返せ。
#       (!!) :: [a] -> Int -> a
class Array
  def my_index(num)
    return self.first if num.zero?

    self.drop(1).my_index(num - 1)
  end
end

# Q047: 整列されたリストを二つとり、一つの整列されたリストにして返す関数 merge を直接の再帰を用いて自作せよ。( my_merge )
#       整列されたリストを処理する関数は用いてはならない。
#       ex) merge [2,5,6] [1,3,4] ==> [1,2,3,4,5,6]
class Array
  def my_merge(other)
    return self if other.empty?
    return other if self.empty?

    x, *xs = self
    y, *ys = other

    return [x] + xs.my_merge(other) if x <= y

    [y] + self.my_merge(ys)
  end
end

# Q048: 関数 my_merge を用いてマージソートを実行する関数 msort を再帰を用いて書け。
#       マージソートは、引数のリストを二つに分割し、それぞれを整列した後、再び一つに戻す事で、整列を実現する。
#       最初に、リストを半分に分割する関数 simple_halve を書け。
class Array
  def simple_halve
    return [] if self.empty?

    num = self.size / 2
    [self.take(num), self.drop(num)]
  end

  def msort
    return self if self.size <= 1

    xs, ys = self.simple_halve
    xs.msort.my_merge(ys.msort)
  end
end

# Q049: Haskell の replicate を再帰を用いて自作せよ。( my_replicate_rec )
#       replicate :: Int -> a -> [a]
class Object
  def my_replicate_rec(num)
    return [] if num.zero?

    [self] + self.my_replicate_rec(num - 1)
  end
end
