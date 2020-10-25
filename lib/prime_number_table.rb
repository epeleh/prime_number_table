# frozen_string_literal: true

require 'prime_number_table/version'

module PrimeNumberTable
  def self.print(table_size: 3)
    table_size.times do |row|
      table_size.times { |column| printf('%3d ', prime_number(row + 1) + prime_number(column + 1)) }
      puts
    end
  end

  def self.prime_number(index)
    number = 0
    (index -= 1 if prime?(number += 1)) while index.positive?
    number
  end

  def self.prime?(number)
    return false if number < 2

    @prime_numbers ||= []
    @prime_numbers[number] = (2..number / 2).none? { |i| (number % i).zero? } if @prime_numbers[number].nil?
    @prime_numbers[number]
  end
end
