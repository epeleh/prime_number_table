# frozen_string_literal: true

require 'prime_number_table/version'

module PrimeNumberTable
  extend self

  def dialog
    width, height = loop do
      puts '> Please give matrix dimension (<width>x<height>)'
      dimension = gets.delete(' ').strip.downcase
      break dimension if /^\d+x\d+$/ =~ dimension
    end.split('x').map(&:to_i)

    numbers = begin
      puts '> Should I use (P)rime numbers or (F)ibonacci numbers?'
      input = gets.strip.downcase
      { p: :prime, f: :fibonacci }.fetch(input.to_sym, input).tap(&method(:validate_numbers!))
    rescue ArgumentError
      retry
    end

    operation = begin
      puts '> Multiplication (*) or Addition (+)'
      input = gets.strip.downcase
      { m: :multiplication, a: :addition }.fetch(input.to_sym, input).tap(&method(:validate_operation!))
    rescue ArgumentError
      retry
    end

    puts
    print(width: width, height: height, numbers: numbers, operation: operation)
    puts
  end

  def print(table_size: nil, width: 3, height: 3, numbers: :prime, operation: :addition)
    validate_numbers!(numbers)
    validate_operation!(operation)

    operation = { addition: :+, multiplication: :* }.fetch(operation.to_sym, operation)

    (1..table_size || height).each do |row|
      (1..table_size || width).each do |column|
        y = public_send("#{numbers}_number", row)
        x = public_send("#{numbers}_number", column)
        printf('%3d ', x.public_send(operation, y))
      end

      puts
    end

    nil
  end

  def fibonacci_number(index)
    @fibonacci_numbers ||= Hash.new { |hash, key| hash[key] = key < 2 ? key : hash[key - 1] + hash[key - 2] }
    @fibonacci_numbers[index]
  end

  def prime_number(index)
    number = 0
    (index -= 1 if prime?(number += 1)) while index.positive?
    number
  end

  def prime?(number)
    return false if number < 2

    @prime_numbers ||= []
    @prime_numbers[number] = (2..number / 2).none? { |i| (number % i).zero? } if @prime_numbers[number].nil?
    @prime_numbers[number]
  end

  private

  def validate_numbers!(numbers)
    numbers_options = %w[prime fibonacci]
    return if numbers_options.include?(numbers.to_s)

    raise(ArgumentError, "numbers: '#{numbers}', allowed options: '#{numbers_options.join("', '")}'")
  end

  def validate_operation!(operation)
    operation_options = %w[addition + multiplication *]
    return if operation_options.include?(operation.to_s)

    raise(ArgumentError, "operation: '#{operation}', allowed options: '#{operation_options.join("', '")}'")
  end
end
