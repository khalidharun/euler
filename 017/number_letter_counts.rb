#!/usr/bin/env ruby
require 'humanize'
puts (1..1000).map {|num| num.humanize.gsub(/[- ]/, "").length}.reduce(&:+)
