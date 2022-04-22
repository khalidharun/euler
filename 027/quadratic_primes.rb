#! /usr/bin/env ruby

require './lib/utils'
require './lib/primes'
require 'pry'
require 'memoist'

DEBUG = false

def consecutive_primes(a, b)
  num = 0
  loop do
    val = num**2 + a*num + b
    break if !val.is_prime
    num += 1
  end
  # debug a, b, num
  num
end

def find_best_quadratic_primes
  best_score = 0
  best_params = nil

  (1...1000).each do |b|
    next unless b.is_prime
    (-999..999).each do |a|
      score = consecutive_primes(a, b)
      if score > best_score
        best_score = score
        best_params = [a, b]
        debug "score(#{a}, #{b}) =", score
      end
    end
  end
  debug "best params:", best_params
  best_params
end

puts find_best_quadratic_primes.reduce(&:*)
