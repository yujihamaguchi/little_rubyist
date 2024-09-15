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
    lt = xs.filter { |x_| x_ < x }
    ge = xs.filter { |x_| x_ >= x }
    ge.rqsort + [x] + lt.rqsort
  end
end
