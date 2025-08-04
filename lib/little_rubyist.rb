# frozen_string_literal: true

# noinspection SpellCheckingInspection
require_relative "little_rubyist/version"
require "set"

# Suppress warnings from bmg gem
original_verbose = $VERBOSE
$VERBOSE = nil
require "bmg"
$VERBOSE = original_verbose

# Q000: haskell の zip と同様の機能の関数 my_zip を書け （パラメータの数は可変であること）
# zip :: [a] -> [b] -> [(a, b)]
class Array
  def my_zip(*others)
    return [] if self.empty? || others.any?(&:empty?)

    first, *rest = self
    [[first, *others.map(&:first)]] + rest.my_zip(*others.map { |arr| arr.drop(1) })
  end
end

# Q001: Haskell の sum と同様の機能の関数 my_sum を書け。(再帰を用いるパターン, reduce を用いるパターン)
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

    first, *rest = self
    first + rest.my_sum
  end
  # reduce
  # def my_sum
  #   self.reduce(0) { |acc, item| acc + item }
  # end
end

# Q002: クイックソート関数 my_quick_sort を書け
class Array
  def my_quick_sort
    return [] if self.empty?

    pivot, *rest = self
    less_than, greater_equal = rest.partition { |item| item < pivot }
    less_than.my_quick_sort + [pivot] + greater_equal.my_quick_sort
  end
end

# Q003: Haskell の product と同様の機能の関数( my_product )を書け(再帰を用いるパターン、 reduce を用いるパターン)
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

    first, *rest = self
    first * rest.my_product
  end
  # # reduce
  # def my_product
  #   self.reduce(1) { |acc, num| num * acc }
  # end
end

# Q004: リストを逆順に整列する関数 reverse_quick_sort を再帰を用いて書け
class Array
  def reverse_quick_sort
    return [] if self.empty?

    first, *rest = self
    greater_equal = rest.select { |item| item >= first }
    less_than = rest.select { |item| item < first }
    greater_equal.reverse_quick_sort + [first] + less_than.reverse_quick_sort
  end
end

# Q005: Haskell の last と同様の機能の関数 my_last を書け(再帰を用いるバージョンも書くこと)
#       last :: [a] -> a
#       リストの最後の要素を返す。
#       last [1,2,3]   = 3
class Array
  def my_last
    raise StopIteration if self.empty?

    self.reverse.first
  end
  # # recursion
  # def my_last
  #   raise StopIteration if self.empty?
  #
  #   first, *rest = self
  #   return first if rest.empty?
  #
  #   rest.my_last
  # end
end

# Q006: 偶数の長さを持つリストを半分ずつに分割する関数 halve を書け。
class Array
  def halve
    raise ArgumentError if self.empty?
    raise ArgumentError if self.length.odd?

    halve_length = self.length / 2
    [self.take(halve_length), self.drop(halve_length)]
  end
end

#  Q007: my-concat を書け。(再帰と reduce)
#  concat :: [[a]] -> [a]
#  concat xs
#      リストのリスト xs を一つのリストに連結する。
#          concat [[1,2], [3,4], [5,6]]    = [1,2,3,4,5,6]
#          concat [[]]                     = []
#          concat []                       = []
class Array
  # recursion
  def my_concat
    return [] if self.empty?

    first, *rest = self
    first + rest.my_concat
  end
  # # reduce
  # def my_concat
  #   self.reduce([]) { |acc, elm| acc + elm }
  # end
end

# Q008: 正の整数に対し、すべての約数を計算する関数 my_factors を書け
class Integer
  def my_factors
    (1..self).select { |int| (self % int).zero? }
  end
end

# Q009: 対( pair )のリストを検索キーで探索し、対応する値を取り出してリストにする関数 my_select を再帰を用いて書け。
class Array
  def my_select(target_key)
    return [] if self.empty?

    (key, value), *rest = self
    (target_key == key ? [value] : []) + rest.my_select(target_key)
  end
end

# Q010: リストのリストから、リストの先頭の要素を取り出してリストを生成する firsts を書け。
class String
  def first
    self.chars.first
  end
end

class Array
  def firsts
    self.map(&:first)
  end
end

# Q011: haskell の length を、 sum とリスト内包表記で my_length として書け。
# length :: [a] -> Int
# length xs
#     リスト xs の長さを返す。
#         length [1,2,3]   = 3
#         length "abcde"   = 5
#         length []        = 0
#         length ""        = 0
module Enumerable
  def my_length
    self.map { |_| 1 }.sum
  end
end

class String
  def my_length
    self.chars.my_length
  end
end

# Q012: my_factors を用いて、整数が素数か判定する関数 prime? を書け。
class Integer
  def prime?
    return false if self == 1

    self.my_factors == [1, self]
  end
end

# Q013: prime? を用いて与えられた上限数までの全ての素数を生成する関数 primes_by を書け。
def primes_by(max)
  (1..max).select(&:prime?)
end

# Q014: リストから隣り合う要素をマップにして返す関数 pairs を Enumerable#each_cons を用いて書け。
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

# Q015: 目的とする値がリストのどの位置にあるかを調べて、その位置全てをリストとして返す関数 positions を書け。(index は 0 から開始される事)
class Array
  def positions(target_value)
    (0...self.size).zip(self)
                   .compact
                   .select { |(_, value)| target_value == value }
                   .map { |(index, _)| index }
  end
end

# Q016: 指定した特定の文字がいくつ含まれているか数える関数 my_count を書け。
class String
  def my_count(target_char)
    raise ArgumentError unless target_char.length == 1

    # select
    self.chars.select { |char| target_char == char }.length

    # # reduce
    # self.chars.reduce(0) { |acc, char| target_char == char ? acc + 1 : acc }

    # # recursion
    # return 0 if self.empty?
    #
    # first, *rest = self.chars
    # (target_char == first ? 1 : 0) + rest.join.my_count(target_char)
  end
end

# Q017: 文字列から小文字を数える関数 lower_count を書け。
class String
  # use Multiple Character Selectors
  def lower_count
    self.count("a-z")
  end
  # # use scan
  # def lower_count
  #   self.scan(/[a-z]/).length
  # end
end

# Q018: 与えられた上限の数値までに含まれる完全数全てを算出する関数 perfects を関数 my_factors および my_sum を使って定義せよ。
#       完全数：自分自身をのぞく約数の和が自分自身と等しい整数
class Integer
  def perfects
    (1..self).select do |int|
      int.my_factors.my_sum - int == int
    end
  end
end

# Q019: ピタゴラス数のリストを生成する関数 pyths を定義せよ。
#       ただし、ピタゴラス数の要素は与えられた上限 value 以下であるとする。
class Integer
  def pyths
    (1..self).to_a.combination(3).select { |x, y, z| x**2 + y**2 == z**2 }
  end
end

# Q020: ある要素のみからなるリストを生成する関数 my_replicate を書け。(直接の再帰、末尾再帰のそれぞれを書け)
class Object
  # direct recursion
  def my_replicate(num)
    return [] if num.zero?

    [self] + self.my_replicate(num - 1)
  end
  # # tail recursion
  # def my_replicate(num)
  #   my_replicate_inner = lambda { |acc, num|
  #     return acc if num.zero?
  #
  #     my_replicate_inner.call(acc << self, num - 1)
  #   }
  #   my_replicate_inner.call([], num)
  # end
end

# Q021: 二つの整数のリストの内積を求める関数　scalar_product　を書け。( sum を使うパターン、 reduce を使うパターンそれぞれ書け )
class Array
  def scalar_product(other)
    # # use sum
    # self.zip(other).sum { |num1, num2| num1 * num2 }
    # use reduce
    self.zip(other).reduce(0) { |acc, (num1, num2)| acc + num1 * num2 }
  end
end

# Q022: リストの順番を逆転する関数 my-reverse を直接の再帰を用いて自作せよ。
class Array
  def my_reverse
    return [] if self.empty?

    first, *rest = self
    rest.my_reverse + [first]
  end
end

# Q023: ある要素を、整列されたリストに挿入する関数 my_insert を書け。( *_while および、再帰の両方のバージョンを書け )
class Array
  # user *_while
  def my_insert(insert_elm = nil)
    return self if insert_elm.nil?

    self.take_while { |elm| elm < insert_elm } + [insert_elm] + self.drop_while { |elm| elm < insert_elm }
  end

  # # user recursion
  # def my_insert(elm = nil)
  #   return self if elm.nil?
  #   return [elm] if self.empty?
  #
  #   first, *rest = self
  #
  #   return [elm] + self if first > elm
  #
  #   [first] + rest.my_insert(elm)
  # end
end

# Q024: 関数 my_insert を用いてリストのソートを「挿入ソート」で行う関数　sort_by_insertion　を書け。
class Array
  def sort_by_insertion
    return [] if self.empty?

    first, *rest = self
    rest.sort_by_insertion.my_insert(first)
  end
end

# Q025: drop を再帰を用いて自作( my_drop )せよ。
class Array
  def my_drop(num)
    return self if self.empty? || num.zero?

    _, *rest = self
    rest.my_drop(num - 1)
  end
end

# Q026: Haskell の zip 関数を直接の再帰を用いて自作( my_zip_2 )せよ。( case 句を用いたパターンマッチングを用いた書き方でも書け。 )
#       [a] -> [b] -> [(a,b)]
class Array
  def my_zip_2(other)
    return [] if self.empty? || other.empty?

    first1, *rest1 = self
    first2, *rest2 = other

    [[first1, first2]] + rest1.my_zip_2(rest2)
  end
  # # use case
  # def my_zip_2(other)
  #   case [self, other]
  #   in [[first1, *rest1], [first2, *rest2]]
  #     [[first1, first2]] + rest1.my_zip_2(rest2)
  #   else
  #     []
  #   end
  # end
end

# Q027: even と odd を相互再帰を用いて自作( my_even?, my_odd? )せよ。（各メソッドの実装は一行で書ける）

class Integer
  def my_even?
    self.zero? || (self.abs - 1).my_odd?
  end

  def my_odd?
    !self.zero? && (self.abs - 1).my_even?
  end
end

# Q028: 0 以上の整数 n に対し、 n 番目のフィボナッチ数を求める関数 fibonacci を直接の再帰を用いて書け。
class Integer
  def fibonacci
    return 0 if self.zero?
    return 1 if self == 1

    (self - 1).fibonacci + (self - 2).fibonacci
  end
end

# Q029: qsort を再帰を用いて書け。（直接の再帰を用いて）
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

# Q030: リストから偶数の位置の要素を取り出す関数 evens と、奇数の位置の要素を取り出す関数 odds を相互再帰を用いて書け。
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

# Q031: Haskell の init 関数を自作( my_init )せよ。(直接の再帰を用いたもの、遅延評価関数を用いたもの両方書くこと）
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

# Q032: Haskell の elem を直接の再帰を用いて自作( my_elem )せよ。
#       elem :: Eq a => a -> [a] -> Bool
class Object
  def my_elem(arr)
    return false if arr.empty?

    self == arr.first || self.my_elem(arr.drop(1))
  end
end

# Q033: Haskell の !! を my_index という名のメソッドとして直接の再帰を用いて自作せよ。該当する要素がない場合は nil を返せ。
#       (!!) :: [a] -> Int -> a
class Array
  def my_index(num)
    return self.first if num.zero?

    self.drop(1).my_index(num - 1)
  end
end

# Q034: 整列されたリストを二つとり、一つの整列されたリストにして返す関数 merge を直接の再帰を用いて自作せよ。( my_merge )
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

# Q035: 関数 my_merge を用いてマージソートを実行する関数 msort を再帰を用いて書け。
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

# Q036: Haskell の replicate を再帰を用いて自作せよ。( my_replicate_rec )
#       replicate :: Int -> a -> [a]
class Object
  def my_replicate_rec(num)
    return [] if num.zero?

    [self] + self.my_replicate_rec(num - 1)
  end
end

# Q037: 負でない整数に対する累乗演算を行う関数 my を直接の再帰を用いて定義せよ。
class Integer
  def my(other)
    return 1 if other.zero?

    self * self.my(other - 1)
  end
end

# Q038: map 直接の再帰を用いて自作せよ( my_map )。
class Array
  def my_map(lmd)
    return [] if self.empty?

    [lmd.call(self.first)] + self.drop(1).my_map(lmd)
  end
end

# Q039: filterを直接の再帰を用いて自作せよ。( my_filter )
class Array
  def my_filter(pred)
    return [] if self.empty?

    (pred.call(self.first) ? [self.first] : []) + self.drop(1).my_filter(pred)
  end
end

# Q040: リストの先頭から述語を満たす連続した要素を取り除く関数 drop-while を自作せよ。( my_drop_while )
class Array
  def my_drop_while(lmd)
    return [] if self.empty?

    lmd.call(self.first) ? self.drop(1).my_drop_while(lmd) : self
  end
end

# Q041: リストの先頭から述語を満たす連続した要素を取り出す関数 takeWhile を自作せよ。( my_take_while )
class Array
  def my_take_while(lmd)
    return [] if self.empty?

    lmd.call(self.first) ? [self.first] + self.drop(1).my_take_while(lmd) : []
  end
end

# Q042: foldr を自作せよ。（ my_foldr ）
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

# Q043: foldl を自作せよ。（ my-foldl ）
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

# Q044: ビットのリストで表現される二進表記を整数に変換する関数 bits_to_int を書け。
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

# Q045: 負でない整数を二進表記へ変換する関数 int_to_bits を書け。( 0 は正の整数ではない )
class Integer
  def int_to_bits
    return [] if self < 1

    [self % 2] + (self / 2).int_to_bits
  end
end

# Q046: 二進表記が必ず 8 ビットになるように切り詰めたり適切な数の 0 を詰め込んだりする関数 make8 を書け。
class Array
  def make8
    (self + [0] * 8).take(8)
  end
end

# Q047: ビット列を 8 ビットの二進表記に分割する関数 chop8 を書け。
class Array
  def chop8
    return [] if self.empty?

    [self.take(8).make8] + self.drop(8).chop8
  end
end

# Q048: ビットのリストを文字列に復号する関数 decode を書け。
#       リストを分割し、二進表記を Unicode のコードポイント（整数）へ変換し、文字へ直して、全体として文字列にする。
class Array
  def decode
    self.chop8.map { |bs| bs.bits_to_int.chr }.join
  end
end

# Q049: 文字列をビット列に符号化する関数 encode を書け。
#       それぞれの文字列を unicode のコードポイント（整数）に変換し、
#       さらに 8 ビットの二進表記に直して、全体を連結することで、ビットのリストを作る。
class String
  def my_encode
    self.chars.flat_map do |c|
      c.ord.int_to_bits.make8
    end
  end
end

# Q050: 関数 all を自作せよ。( my_all? )
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

# Q051: 関数 any を自作せよ。( my_any? )
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

# Q052: compositions のキーワード :name の別名として :title を持つ集合を取得せよ。( set1 関数の戻り値として )
def set1
  COMPOSITIONS.rename(name: :title).to_set
end

# Q053: compositions から :name が "Requiem" のレコードを抽出せよ（ set2 関数の戻り値として）
def set2
  COMPOSITIONS.restrict(name: "Requiem").to_set
end

# Q054: compositions を　:name で射影せよ。（ set3 関数の戻り値として）
def set3
  COMPOSITIONS.project([:name]).to_set
end

# Q055: compositions と composers を自然結合せよ。（ set4 関数の戻り値として ）
def set4
  COMPOSITIONS.join(COMPOSERS, [:composer]).to_set
end

# Q056: composers と nations を :country と :nation で結合せよ。（ set5 関数の戻り値として）
def set5
  COMPOSERS.join(NATIONS, country: :nation).to_set
end

# Q057: compositions から :name が "Requiem" のレコードを抽出し、 composers と自然結合し、 :country キーで射影せよ。（ set6 関数の戻り値として）
def set6
  COMPOSITIONS.restrict(name: "Requiem").join(COMPOSERS, [:composer]).project([:country]).to_set
end

# Q058: 最底部に bottom というシンボルを持つ、任意の n レベルまでネストしたリストを作る deeply-nested 関数を書け。
class Object
  def deeply_nested(n)
    return self if n.zero?

    [self].deeply_nested(n - 1)
  end
end

# Q059: 以下のコイントスの結果データ（ :h 表、 :t 裏 ）について、 表が 2 回続けて出たケースをカウントする関数 count_heads_pairs を再帰を用いて書け。
class Array
  def count_heads_pairs
    return 0 if self.count < 2

    (self.take(2).all? { |r| r == :h } ? 1 : 0) + self.drop(1).count_heads_pairs
  end
end

# Q060: 以下の変換を行う関数 by-pairs を書け。
#     変換前： [:h :t :t :h :h :h]
#     変換後： ((:h :t) (:t :t) (:t :h) (:h :h) (:h :h))
class Array
  def by_pairs
    return [] if self.count < 2

    [self.take(2)] + self.drop(1).by_pairs
  end
end

# Q061: 関数の返り値として、非ゼロ値の順番を保ったまま、 ゼロ値を末尾に移動しする関数 move_zeros_2_back を書け
#         [0,1,2,3] -> [1,2,3,0]
#         [4,1,0,0,5] -> [4,1,5,0,0]
class Array
  def move_zeros_2_back
    self.reject(&:zero?) + self.select(&:zero?)
  end
end

# Q062: 空配列ではなく、さらに1つの要素を除いて同じ要素が必ず2度現れるリストの中で1度しか現れない唯一の要素を返す関数 unique_attribute を書け
#         [1,2,2] -> 1
#         [1,2,2,3,1] -> 3
#         [1] -> 1
class Array
  def unique_attribute
    return self.first if self.count == 1

    self.group_by { |x| x }.filter_map { |k, v| k if v.count == 1 }.first
  end
end

# Q063: 間隔が重複しないように間隔同士を組み合わせる関数 merge_intervals を書け。先立って overlap? 述語を書くと便利である。
#         [[1,2],[2,3],[3,4]] -> [[1,4]]
#         [[1,3],[1,3],[4,5]] -> [[1,3],[4,5]]
#         [[1,3],[0,3],[4,5]] -> [[0,3],[4,5]]
#         [[1,6],[2,5],[3,4]] -> [[1,6]]
#         [[1,3],[4,6],[7,9]] -> [[1,3],[4,6],[7,9]]
class Array
  def overlap?(other)
    self.last >= other.first && self.first <= other.last
  end

  def merge_intervals
    self.sort.reduce([]) do |acc, p|
      next acc.push(p) if acc.empty?

      if acc.last.overlap?(p)
        acc.take(acc.size - 1).push([[acc.last.first, p.first].min,
                                     [acc.last.last, p.last].max])
      else
        acc.push(p)
      end
    end
  end
end

# Q064: s-list （シンボルとシンボルのリスト両方を要素に出来るリスト）、 old_sym、 new_sym を引数に取り
#       s-list の中の old_sym をすべて new_sym に置き換える関数 replace_symbol を
#       シンボル（と見られる要素）の置換を行う replace_symbol_expression 関数との相互再帰で書け。
#
#       (replace-symbol '((a b) (((b g r) (f r)) c (d e)) b) 'b 'a)
#       ;;= ((a a) (((a g r) (f r)) c (d e)) a)
class Array
  def replace_symbol(old_sym, new_sym)
    return [] if self.empty?

    [self.first.replace_symbol_expression(old_sym, new_sym)] + self.drop(1).replace_symbol(old_sym, new_sym)
  end
end

class Object
  def replace_symbol_expression(old_sym, new_sym)
    if self.is_a?(Symbol)
      return new_sym if self == old_sym

      self
    else
      self.replace_symbol(old_sym, new_sym)
    end
  end
end

# Q065: 名前（ username ）をパラメータとし、 "{greeting_prefix}, {username}" の文字列を返す関数を返す、
#       挨拶の種類（ greeting_prefix ）をパラメータとする関数 make_greeter を書け。
#
#       ((make-greeter "Hello") "Yuji")
#       ;;= "Hello, Yuji"
#       ((make-greeter "Aloha") "Yuji")
#       ;;= "Aloha, Yuji"
class String
  def make_greeter
    ->(name) { "#{self}, #{name}" }
  end
end

# Q066: 文字列中の文字で、探すべき文字のセットにマッチする文字のインデックスを得る関数 index_filter を書け。
class Set
  def index_filter(string)
    (0...string.length).zip(string.chars)
                       .select { |_, char| self.include?(char) }
                       .map { |index, _| index }
  end
end

# Q067: 以下の動作をする関数 count_runs を Clojure の partition 関数相当のメソッド partition_stride を作ったうえでそれを活用して書け。
#       (count-runs 2 #(= :h %) [:h :t :t :h :h :h])
#       ;;= 2
#       (count-runs 2 #(= :t %) [:h :t :t :h :h :h])
#       ;;= 1
#       (count-runs 3 #(= :h %) [:h :t :t :h :h :h])
#       ;;= 1
class Array
  def partition_stride(count, step = count)
    return [] if self.empty? || self.size < count
    return [self] if count.zero? || step.zero? || count < step

    [self.take(count)] + self.drop(step).partition_stride(count, step)
  end

  def count_runs(count, pred)
    return 0 if self.empty?

    self.partition_stride(count, 1).sum(0) { |p| p.all? { |e| pred.call(e) } ? 1 : 0 }
  end
end

# Q068: バイナリツリーの高さを計算する関数 tree_height を書け。
#       ツリーは :leaf または [:node, left, right] の形式で表現される。
class Object
  def tree_height
    return 0 if self == :leaf

    if self.is_a?(Array) && self.size == 3 && self.first == :node
      left_height = self[1].tree_height
      right_height = self[2].tree_height
      1 + [left_height, right_height].max
    else
      0
    end
  end
end

# Q069: 与えられた範囲内の完全平方数のリストを生成する関数 perfect_squares を書け。
class Integer
  def perfect_squares
    (1..self).select do |n|
      sqrt_n = Math.sqrt(n)
      sqrt_n == sqrt_n.to_i
    end
  end
end

# Q070: リストの要素を回転させる関数 my_rotate を書け。
#       my_rotate(n, list) は list を左に n 要素回転させる。
class Array
  def my_rotate(n)
    return self if self.empty? || n.zero?

    n %= self.size
    self.drop(n) + self.take(n)
  end
end

# Q071: 文字列が回文かどうかを判定する関数 palindrome? を再帰を用いて書け。
class String
  def palindrome?
    return true if self.length <= 1

    return false if self[0] != self[-1]

    self[1...-1].palindrome?
  end
end

# Q072: ハノイの塔の解を求める関数 hanoi を書け。
#       hanoi(n, from, to, aux) は n 枚の円盤を from から to へ aux を経由して移動する手順を返す。
def hanoi(n, from, to, aux)
  return [] if n.zero?

  hanoi(n - 1, from, aux, to) +
    [[from, to]] +
    hanoi(n - 1, aux, to, from)
end
