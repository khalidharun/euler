#!/usr/bin/env ruby
require 'pry'
require 'memoist'

WEIGHTS = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

class MaxSumTriangle
  extend Memoist

  def initialize
    @weights = read_weights
  end

  def read_weights
    w = {}
    counter = 1
    WEIGHTS.each_line do |x|
      values = x.split.map(&:to_i)
      keys = 1..values.length
      w[counter] = Hash[keys.zip values]
      counter += 1
    end
    w
  end

  def weight(i,j)
    @weights[i][j]
  end

  def find_cost(i,j)
    space = '.' * (15-i)
    puts "#{ space }Entering cost(#{i}, #{j})"
    return 0 if i < 1 || j < 1 || i < j

    cost = [find_cost(i-1, j), find_cost(i-1, j-1)].max + weight(i,j)
    puts "#{ space }cost(#{i}, #{j}) = #{cost}"
    cost
  end

  memoize :find_cost
end

tri = MaxSumTriangle.new
N = 15
score = (1..N).map do |j| tri.find_cost(N, j) end.max
puts score
