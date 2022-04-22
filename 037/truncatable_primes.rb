#!/usr/bin/env ruby

require 'pry'
require './lib/utils'
require './lib/primes'

DEBUG = true

def grow(x)
  debug "try", x
  return unless x.empty? || (x.to_i.is_prime && x.reverse.to_i.is_prime)
  debug "Found:", x
  cands = (2..9).map do |i| [i.to_s + x, x + i.to_s] end.flatten.uniq
  result = [x] + cands.map do |c| grow c end.compact.flatten.uniq
end

if __FILE__ == $PROGRAM_NAME
  results = grow ""
  puts (results.select do |x| x.length > 1 end).uniq.to_s
end
