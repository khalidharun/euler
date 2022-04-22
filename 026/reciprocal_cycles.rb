#! /usr/bin/env ruby
#
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

require 'pry'

require './lib/utils'

DEBUG = FALSE

class Fixnum
  def repeating_remainders()
    remainders = []
    digits = []
    rem = 1
    while TRUE do
      val = (10 * rem) / self
      digits.push val
      rem = (10 * rem) % self
      remainders = [] if rem == 0
      break if rem == 0 || remainders.include?(rem)
      remainders.push rem
    end
    debug self.to_s + ": " + remainders.length.to_s + " | " + digits.join("")
    debug "Remainders: " + remainders.join(" ")
    return 0 if remainders.empty?
    return remainders.length - remainders.find_index(rem)
  end
end

scores = (1...1000).map(&:repeating_remainders)

puts (1 + scores.find_index(scores.max))
