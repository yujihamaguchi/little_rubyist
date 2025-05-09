# frozen_string_literal: true

# noinspection SpellCheckingInspection
require_relative "little_rubyist/version"
require "set"
require "bmg"

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
  #   self.reduce(0, &->(acc, value) { acc + value })
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

# Q004: Haskell の product と同様の機能の関数( my_product )を書け(再帰を用いるパターン、 reduce を用いるパターン)
# product :: (Num a) => [a] -> a
# product ns
#     数値のリスト ns の全要素の積を返す。
#         product [2, 3, 4]   = 24
#         product [4, 5, 0]   = 0
#         product []          = 1
class Array
  # recursion
  def my_product
    return 1 if self.empty?

    self.first * self.drop(1).my_product
  end

  # # reduce
  # def my_product
  #   self.reduce(1, &->(acc, value) { acc * value })
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
    self.reduce([], &->(acc, x) { acc + x })
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
    self.reduce(0, &->(acc, _) { acc + 1 })
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
    self.zip(other).reduce(0, &->(acc, (n, m)) { acc + n * m })
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

# Q050: 負でない整数に対する累乗演算を行う関数 my を直接の再帰を用いて定義せよ。
class Integer
  def my(other)
    return 1 if other.zero?

    self * self.my(other - 1)
  end
end

# Q051: map 直接の再帰を用いて自作せよ( my_map )。
class Array
  def my_map(lmd)
    return [] if self.empty?

    [lmd.call(self.first)] + self.drop(1).my_map(lmd)
  end
end

# Q052: filterを直接の再帰を用いて自作せよ。( my_filter )
class Array
  def my_filter(pred)
    return [] if self.empty?

    (pred.call(self.first) ? [self.first] : []) + self.drop(1).my_filter(pred)
  end
end

# Q054: リストの先頭から述語を満たす連続した要素を取り除く関数 drop-while を自作せよ。( my_drop_while )
class Array
  def my_drop_while(lmd)
    return [] if self.empty?

    lmd.call(self.first) ? self.drop(1).my_drop_while(lmd) : self
  end
end

# Q056: リストの先頭から述語を満たす連続した要素を取り出す関数 takeWhile を自作せよ。( my_take_while )
class Array
  def my_take_while(lmd)
    return [] if self.empty?

    lmd.call(self.first) ? [self.first] + self.drop(1).my_take_while(lmd) : []
  end
end

# Q057-00: foldr を自作せよ。（ my_foldr ）
#         以下のように、 foldr に部分適用して関数をつくることができる。
#
#         cons = foldr (:) []
#         sum = foldr (+) 0
#         product = foldr (*) 1
#         or = foldr (||) False
#         and = foldr (&&) True
#
#       hint)
#       * Haskell では以下のような実装になる。
#
#         myFoldr :: (a -> b -> b) -> b -> [a] -> b
#         myFoldr _ v [] = v
#         myFoldr f v (x:xs) = f x (myFoldr f v xs)
class Array
  def my_foldr(lmd, init)
    return init if self.empty?

    x, *xs = self
    lmd.call(x, xs.my_foldr(lmd, init))
  end
end

# Q057-01: foldl を自作せよ。（ my-foldl ）
#          * Haskell では以下のような実装になる。
#
#            myFoldr :: (a -> b -> a) -> a -> [b] -> a
#            myFoldr _ v [] = v
#            myFoldr f v (x:xs) = foldl f (f v x) xs
class Array
  def my_foldl(lmd, init)
    return init if self.empty?

    x, *xs = self
    xs.my_foldl(lmd, lmd.call(init, x))
  end
end

# Q057-02: ビットのリストで表現される二進表記を整数に変換する関数 bits_to_int を書け。
#          ・ iterateを用いること
#          ・ 二進表記は逆順であること
#
# type Bit = Int
# bit2int :: [Bit] -> Int
# bit2int bits = sum [b * w | (b, w) <- zip bits weights]
#                 where
#                   weights = iterate (*2) 1
class Array
  def bits_to_int
    weights = Enumerator.produce(1, &->(n) { n * 2 }).lazy
    self.zip(weights).reduce(0, &->(acc, (n, m)) { acc + n * m })
  end
end

# Q058: 負でない整数を二進表記へ変換する関数 int_to_bits を書け。( 0 は正の整数ではない )
class Integer
  def int_to_bits
    return [] if self < 1

    [self % 2] + (self / 2).int_to_bits
  end
end

# Q059: 二進表記が必ず 8 ビットになるように切り詰めたり適切な数の 0 を詰め込んだりする関数 make8 を書け。
class Array
  def make8
    (self + [0] * 8).take(8)
  end
end

# Q060: ビット列を 8 ビットの二進表記に分割する関数 chop8 を書け。
class Array
  def chop8
    return [] if self.empty?

    [self.take(8).make8] + self.drop(8).chop8
  end
end

# Q061: ビットのリストを文字列に復号する関数 decode を書け。
#       リストを分割し、二進表記を Unicode のコードポイント（整数）へ変換し、文字へ直して、全体として文字列にする。
class Array
  def decode
    self.chop8.map { |bs| bs.bits_to_int.chr }.join
  end
end

# Q062: 文字列をビット列に符号化する関数 encode を書け。
#       それぞれの文字列を unicode のコードポイント（整数）に変換し、
#       さらに 8 ビットの二進表記に直して、全体を連結することで、ビットのリストを作る。
class String
  def my_encode
    self.chars.flat_map do |c|
      c.ord.int_to_bits.make8
    end
  end
end

# Q063: 関数 all を自作せよ。( my_all? )
#       all :: (a -> Bool) -> [a] -> Bool
#       all f xs
#       xs の要素 x について、f x がすべて True なら True。
#
#       all (==1) [5,4,3,2,1]   = False
#       all (==1) [1,1,1]       = True
#       all (==1) []            = True
class Array
  def my_all?(pred)
    return true if self.empty?

    pred.call(self.first) && self.drop(1).my_all?(pred)
  end
end

# Q064: 関数 any を自作せよ。( my_any? )
#       any :: (a -> Bool) -> [a] -> Bool
#       any f xs
#       xs のいずれかの要素 x について f x が True ならば True。
#
#       any (== 1) [5, 4, 3, 2, 1]   = True
#       any (== 1) [5, 4, 1, 2, 3]   = True
#       any (== 1) [5, 4, 3, 2]      = False
class Array
  def my_any?(pred)
    return false if self.empty?

    pred.call(self.first) || self.drop(1).my_any?(pred)
  end
end

COMPOSITIONS = Bmg::Relation.new([
                                   { name: "The Art of the Fugue", composer: "J. S. Bach" },
                                   { name: "Requiem", composer: "W. A. Mozart" },
                                   { name: "Requiem", composer: "Giuseppe Verdi" },
                                   { name: "Musical Offering", composer: "J. S. Bach" }
                                 ])

COMPOSERS = Bmg::Relation.new([
                                { composer: "J. S. Bach", country: "Germany" },
                                { composer: "W. A. Mozart", country: "Austria" },
                                { composer: "Giuseppe Verdi", country: "Italy" }
                              ])

NATIONS = Bmg::Relation.new([
                              { nation: "Germany", language: "Germany" },
                              { nation: "Austria", language: "German" },
                              { nation: "Italy", language: "Italian" }
                            ])

# Q067: compositions のキーワード :name の別名として :title を持つ集合を取得せよ。( set1 関数の戻り値として )
def set1
  COMPOSITIONS.rename(name: :title).to_a
end

# Q068: compositions から :name が "Requiem" のレコードを抽出せよ（ set2 関数の戻り値として）
def set2
  COMPOSITIONS.restrict(name: "Requiem").to_a
end

# Q069: compositions を　:name で射影せよ。（ set3 関数の戻り値として）
def set3
  COMPOSITIONS.project([:name]).to_a
end

# Q070: compositions と composers を自然結合せよ。（ set4 関数の戻り値として ）
def set4
  COMPOSITIONS.join(COMPOSERS, [:composer]).to_a
end
