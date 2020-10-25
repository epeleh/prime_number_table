# frozen_string_literal: true

require 'prime_number_table/version'

module PrimeNumberTable
  class Error < StandardError; end

  def self.print(_table_size)
    raise 'TODO'
  end

  def self.prime_number(index)
    number = 0
    (index -= 1 if prime?(number += 1)) while index.positive?
    number
  end

  def self.prime?(number)
    return false if number < 2

    @prime_numbers ||= [false, false]

    if @prime_numbers[number].nil?
      (@prime_numbers.size..number).each do |n|
        @prime_numbers[n] = (2..n / 2).none? { |i| (n % i).zero? }
      end
    end

    @prime_numbers[number]
  end
end
