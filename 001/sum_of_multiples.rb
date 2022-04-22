def main(limit)
  (1..(limit-1)).lazy.map do |x| ((x % 3 == 0) || (x % 5 == 0)) && x || 0 end.sum
end

puts main(1000)
