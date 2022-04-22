require 'byebug'

def concatenated_product(k, n)
  (1..n).map do |x|
    ( k * x ).to_s
  end.reduce(&:+)
end

def is_pandigital(x)
  x.split("").uniq.length == 9
end

def find_max_pandigital(limit)
  candidates = []

  k = 1
  while k < limit
    n = 2
    while true
      concat_prod = concatenated_product(k, n)
      break if concat_prod.length > 9

      puts ({value: concat_prod, k: k, n: n}) if is_pandigital(concat_prod)
      candidates.push(concat_prod) if is_pandigital(concat_prod)
      n = n + 1
    end

    k = k + 1
  end
  puts candidates.max
end

find_max_pandigital(1000000)
