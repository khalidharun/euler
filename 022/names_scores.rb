#! /usr/bin/env ruby
require 'pry'

class String
  def score
    self.split("").map(&:ord).reduce(&:+) - 64*self.length
  end
end

filename = "022/p022_names.txt"
buffer = File.read filename
names = buffer.gsub("\"", "").split(",").sort

total = 0
names.each_with_index { |v,i| total += v.score * (i+1) }

puts total
