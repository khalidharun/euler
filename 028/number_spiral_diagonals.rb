#! /usr/bin/env ruby

require './lib/utils'
require 'pry'

# DEBUG = TRUE

def get_diagonals(k)
  return [1] if k == 1

  size = 1 + 2 * (k - 1)
  debug size
  fin = size ** 2
  start = (size - 2) ** 2
  (start..fin).step(size-1).to_a.drop(1)
end

total = (1..501).map do |k| get_diagonals(k) end.reduce(&:+).reduce(&:+)
puts total
