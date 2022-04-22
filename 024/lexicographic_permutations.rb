#! /usr/bin/env ruby
require 'pry'

# DEBUG = true

def debug(*args)
  puts args.join(" ") if !defined?(DEBUG).nil? && DEBUG
end

class Lexo

  attr_reader :limit

  def initialize(limit = 1e6)
    @counter = 0
    @limit = limit
  end

  def permute(current, remaining)
    return if @counter >= limit

    if remaining.empty?
      @counter += 1
      debug @counter, current
      puts @counter, current if @counter == limit
      return
    end

    remaining.sort.each do |i|
      rem = remaining.reject do |x| x == i end
      permute(current+i, rem)
    end
  end
end

l = Lexo.new(1e6.to_i)
l.permute("", (0..9).map(&:to_s))
