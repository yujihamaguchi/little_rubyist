# Q001: haskell の zip と同様の機能の関数 my-zip を書け （パラメータの数は可変であること）
# zip :: [a] -> [b] -> [(a, b)]
# not using recursion
class Array
  def my_zip(*lists)
    return self if lists.empty?
    # self.zip(*lists).reject { |tuple| tuple.include?(nil) }
    lists.unshift(self).transpose
  end
end

# def my_zip(*colls)
#   return nil if colls.empty?
#   colls.first.zip(*colls[1..]).reject { |tuple| tuple.include?(nil) }
# end

def foo(arg, *args)
  puts "arg > #{arg}"
  puts "args > #{args}"
end

def fizzbuzz(number)
  if number % 15 == 0
    'FizzBuzz'
  elsif number % 3 == 0
    'Fizz'
  elsif number % 5 == 0
    'Buzz'
  else
    number.to_s
  end
end
