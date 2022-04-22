#! /usr/bin/env ruby

require "./lib/utils"
require "memoist"

# DEBUG = true

class Pandigital
  class << self
    extend Memoist

    def show_results(*args)
      debug "Starting:", args
      retval = yield
      debug args, retval.class, retval.to_s
      retval
    end

    def generate_pandigital_sets(digits, remaining)
      show_results(digits: digits, remaining: remaining) do
        next digits.to_a.join("").to_i if remaining.empty?

        (0...remaining.length).map do |i|
          val = remaining[i]
          rem = remaining.reject do |x| x == val end
          generate_pandigital_sets(digits + [val], rem)
        end.flatten
      end
    end

    def possible_candidates(num)
      show_results(num: num) do
        digits = num.to_s.split("")
        last = digits.length
        cands = []
        (1..last-2).map do |i|
          (i+1..last-1).map do |j|
            cands.push([digits.slice(0...i), digits[i...j], digits[j...last]].map do |x| x.join("").to_i end)
          end
        end
        cands
      end
    end

    memoize :generate_pandigital_sets
  end
end

def main
  solutions = []
  all_digits = (1..9).to_a
  puts sprintf("Looking for pandigital products of %s", all_digits.to_s)
  Pandigital.generate_pandigital_sets([], all_digits).each do |digits|
    Pandigital.possible_candidates(digits).select do |params|
      if params[0] * params[1] == params[2]
        debug "Found a solution: ", params
        solutions.push params[2]
      end
    end
  end

  solutions.uniq!
  puts sprintf("Solutions: %s", solutions)
  puts sprintf("Sum of products: %s", solutions.reduce(&:+))
end


if __FILE__ == $PROGRAM_NAME
  require 'pry'
  main
end
