def debug(*args)
  puts args.join(" ") if !defined?(DEBUG).nil? && DEBUG
end

