# frozen_string_literal: true

require 'prime_number_table/version'

module PrimeNumberTable
  def self.print(table_size: 3)
    (1..table_size).each do |row|
      (1..table_size).each { |column| printf('%3d ', prime_number(row) + prime_number(column)) }
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
