# frozen_string_literal: true

require_relative "little_rubyist/version"

class Array
  def my_zip(*lists)
    return self if lists.empty?
    # self.zip(*lists).reject { |tuple| tuple.include?(nil) }
    lists.unshift(self).transpose
  end
end

module LittleRubyist
  class Error < StandardError; end
  # Q001: haskell の zip と同様の機能の関数 my-zip を書け （パラメータの数は可変であること）
  # zip :: [a] -> [b] -> [(a, b)]
  # not using recursion
end
