#! /usr/bin/env ruby

# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of 28
# would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than
# n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123 can
# be written as the sum of two abundant numbers. However, this upper limit cannot
# be reduced any further by analysis even though it is known that the greatest
# number that cannot be expressed as the sum of two abundant numbers is less than
# this limit.

# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.

require 'pry'

# DEBUG = true

def debug(*args)
  puts args.join(" ") if !defined?(DEBUG).nil? && DEBUG
end

def get_proper_divisors(n)
  ldivs = (2..Math.sqrt(n).to_i).select do |i| n % i == 0 end.uniq
  divs = [1] + ldivs + ldivs.map do |i| n/i end
  divs.uniq.sort
end

class AbundantSums

  attr_reader :sum_map, :abundant_numbers, :limit

  def initialize(limit = 28123)
    @limit = limit
    @abundant_numbers = find_abundant_numbers
    @sum_map = find_all_sums
  end

  def find_all_sums
    num_map = {}
    finish = abundant_numbers.length
    for i in (0...finish) do
      total = 0
      for j in (i...finish)
        total = abundant_numbers[i] + abundant_numbers[j]
        debug "total: #{total} = #{abundant_numbers[i]} + #{abundant_numbers[j]}"
        num_map[total] = true
        break if total > limit
      end
    end
    num_map
  end

  def find_abundant_numbers
    (2..limit).select do |k|
      result = get_proper_divisors(k).reduce(&:+) > k
      debug k, get_proper_divisors(k).map(&:to_i).join(", ") if result
      result
    end
  end

  def is_abundant_sum(k)
    sum_map.has_key? k
  end

  def find_non_abundant_sums
    (1..limit).reject do |k| is_abundant_sum k end
  end

end

as = AbundantSums.new
puts as.find_non_abundant_sums.reduce(&:+)
