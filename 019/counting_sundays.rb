#! /usr/bin/env ruby
require 'pry'

class SundayCounter
  def initialize
    @epoch = 1
    @dow = 1
    @month = 0
    @year = 1900
    @first_sundays = 0
    @limit = 2000
    @start = 1901
  end

  def increment_month
    @epoch += days_this_month
    @dow += days_this_month
    @dow %= 7
    @month += 1
    @month %= 12
    @year += 1 if @month == 0
    puts "#{@epoch}: #{@dow} #{@year}-#{@month + 1}-01"
    puts Date.new(@year, @month+1, 1).wday

    return if @year < @start || @year > @limit
    if is_sunday
      @first_sundays += 1
    end
  end

  def days_this_month
    return 30 if [9,4,6,11].include?(@month + 1)
    return 28 if @month == 1 && !is_leap_year?
    return 29 if @month == 1 && is_leap_year?
    31
  end

  def is_sunday
    @dow == 6
  end

  def is_leap_year?
    return false if @year % 100 == 0 && @year % 400 != 0
    @year % 4 == 0
  end

  def sundays
    @epoch/7
  end

  def year
    @year
  end

  def days
    @epoch
  end

  def first_sundays
    @first_sundays
  end
end


sc = SundayCounter.new

while sc.year < 2001 do
  sc.increment_month
end

puts "First Sundays: #{ sc.first_sundays }"
