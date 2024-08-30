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

# Q002: haskell の sum と同様の機能の関数 my_sum を書け。(再帰を用いるパターン, reduce を用いるパターン、 apply を用いるパターン)
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

  # # apply
  # class Utils
  #   def self.plus(*args)
  #     args.reduce(0) { |acc, n| acc + n }
  #   end
  # end
  #
  # def my_sum
  #   Utils.plus(*self)
  # end
end
