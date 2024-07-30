def my_zip(*colls)
  return nil if colls.empty?
  colls.first.zip(*colls[1..]).reject { |tuple| tuple.include?(nil) }
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
