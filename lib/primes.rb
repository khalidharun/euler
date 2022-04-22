require 'memoist'

class Prime
  class << self
    extend Memoist

    def is_prime(n)
      return false if n <= 1
      get_proper_divisors(n).length == 1
    end

    def get_proper_divisors(num)
      ldivs = (2..Math.sqrt(num).to_i).select do |i| num % i == 0 end
      divs = ldivs + ldivs.map do |i| num/i end
      divs = [1] + divs.uniq.sort
    end

    memoize :is_prime, :get_proper_divisors
  end
end

class Fixnum
  def is_prime
    Prime.is_prime self
  end
end
