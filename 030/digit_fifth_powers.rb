#! /usr/bin/env ruby

require 'pry'

def is_digit_power(k, pow = 5)
  return false if k < 10
  total =  k.to_s.split("").map do |x| x.to_i ** pow end.reduce(&:+)
  puts k if (k == total)
  k == total
end

def find_fifth_powers(pow = 5)
  fifth_powers = []
  k = 11
  while k < 10 ** (pow + 1) do
    fifth_powers.push(k) if is_digit_power(k, pow)
    k += 1
  end
  fifth_powers
end

def main
  answer = find_fifth_powers(5).reduce(&:+)
  puts "The solution is: #{answer}"
end

if __FILE__ == $PROGRAM_NAME
  main
end
