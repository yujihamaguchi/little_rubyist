# frozen_string_literal: true

require_relative "little_rubyist/version"

class Array
  # Q001: haskell の zip と同様の機能の関数 my-zip を書け （パラメータの数は可変であること）
  # zip :: [a] -> [b] -> [(a, b)]
  # not using recursion
  def my_zip(*lists)
    return self if lists.empty?

    lists.unshift(self)
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
