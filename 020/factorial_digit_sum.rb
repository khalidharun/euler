#! /usr/bin/env ruby

def factorial(x)
  return 1 if x == 1
  x * factorial(x-1)
end

puts factorial(100).to_s.split("").map(&:to_i).reduce(&:+)
