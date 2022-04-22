#! /usr/bin/env ruby
require './lib/utils'
require 'memoist'

DEBUG = true


class Coins
  class << self
    extend Memoist

    def show_results(prefix, *args)
      retval = yield
      debug prefix, args, retval
      retval
    end

    def ways_to_make(total, coins)
      space = " " * (8-coins.length)
      debug space, "make", total, "using", coins

      show_results(space, total: total, coins: coins) do
        next 1 if total == 0

        if coins.length == 1
          coin = coins.first
          next total % coin == 0 ? 1 : 0
        end

        coin = coins.first
        (0..total/coin).map do |k|
          ways_to_make(total - k*coin, coins.drop(1))
        end.reduce(&:+)
      end
    end

    memoize :ways_to_make
  end
end

if __FILE__ == $PROGRAM_NAME
  coins = [200, 100, 50, 20, 10, 5, 2, 1]
  puts Coins.ways_to_make(200, coins)
end
