#! /usr/bin/env ruby

require 'memoist'
require 'pry'

class AmicableNumbers
  extend Memoist

  def initialize
    @amicable_numbers = []
  end

  def sum_of_proper_divisors(n)
    result = get_proper_divisors(n).reduce(&:+)
    # puts "d(#{n}) = #{result}"
    result
  end

  def get_proper_divisors(n)
    ldivs = (2..Math.sqrt(n).to_i).step(1).select do |i| n % i == 0 end
    [1] + ldivs + ldivs.map do |i| n/i end
  end

  alias_method :d, :sum_of_proper_divisors

  def find(limit = 10000)
    a = 2
    while a < limit do
      b = d(a)
      if a != b && a == d(b)
        puts a, b
        @amicable_numbers.push a
        @amicable_numbers.push b
      end
      a += 1
    end
  end

  def amicable_numbers
    @amicable_numbers
  end

  memoize :sum_of_proper_divisors
  memoize :d
end

require 'benchmark'
puts Benchmark.measure {
  an = AmicableNumbers.new
  an.find(10000)
  puts an.amicable_numbers.uniq.reduce(&:+)
}
