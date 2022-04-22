#! /usr/bin/env ruby

require 'memoist'
require 'pry'
require './lib/utils'

DEBUG = true

class Fixnum
  def digits
    10 ** (self - 1)
  end
end

class Fibonacci
  extend Memoist

  def fib(n)
    return 1 if n == 1
    return 1 if n == 2
    return fib(n-1) + fib(n-2)
  end

  def find_first_to(n)
    (1..Float::INFINITY).each do |i|
      val = fib(i)
      if val >= n
        puts [i, val].join(" ")
        break
      end
    end
  end

  memoize :fib
end

f = Fibonacci.new
f.find_first_to(1000.digits)

