# frozen_string_literal: true

FIBONACCI_NUMBERS = [
  1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10_946, 17_711,
  28_657, 46_368, 75_025, 121_393, 196_418, 317_811, 514_229, 832_040, 1_346_269, 2_178_309, 3_524_578,
  5_702_887, 9_227_465, 14_930_352, 24_157_817, 39_088_169, 63_245_986, 102_334_155
].freeze

PRIME_NUMBERS = [
  2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103,
  107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223,
  227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347,
  349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463,
  467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607,
  613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743,
  751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883,
  887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997
].freeze

RSpec.describe PrimeNumberTable do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe '#print' do
    subject { described_class.method(:print) }

    {
      # rubocop:disable Style/RedundantParentheses
      {} => (
        "  4   5   7 \n" \
        "  5   6   8 \n" \
        "  7   8  10 \n"
      ),
      { table_size: 5 } => (
        "  4   5   7   9  13 \n" \
        "  5   6   8  10  14 \n" \
        "  7   8  10  12  16 \n" \
        "  9  10  12  14  18 \n" \
        " 13  14  16  18  22 \n"
      ),
      { width: 6, height: 2 } => (
        "  4   5   7   9  13  15 \n" \
        "  5   6   8  10  14  16 \n"
      ),
      { operation: :multiplication } => (
        "  4   6  10 \n" \
        "  6   9  15 \n" \
        " 10  15  25 \n"
      ),
      { width: 5, height: 4, numbers: :fibonacci, operation: :multiplication } => (
        "  1   1   2   3   5 \n" \
        "  1   1   2   3   5 \n" \
        "  2   2   4   6  10 \n" \
        "  3   3   6   9  15 \n"
      )
      # rubocop:enable Style/RedundantParentheses
    }.each do |options, expected_output|
      context "with options: #{options}" do
        it 'prints the table correctly' do
          expect { subject.call(options) }.to output(expected_output).to_stdout
        end
      end
    end

    {
      { operation: 123 } => ArgumentError.new(
        "operation: '123', allowed options: 'addition', '+', 'multiplication', '*'"
      ),
      { numbers: :lol } => ArgumentError.new(
        "numbers: 'lol', allowed options: 'prime', 'fibonacci'"
      )
    }.each do |options, expected_error|
      context "with options: #{options}" do
        it "raises an error: \"#{expected_error.message}\"" do
          expect { subject.call(options) }.to raise_error(expected_error.class, expected_error.message)
        end
      end
    end
  end

  describe '#fibonacci_number' do
    subject { described_class.method(:fibonacci_number) }

    it 'returns a fibonacci number by its index' do
      FIBONACCI_NUMBERS.each_with_index { |n, i| expect(subject.call(i + 1)).to eq(n) }
    end
  end

  describe '#prime_number' do
    subject { described_class.method(:prime_number) }

    it 'returns a prime number by its index' do
      PRIME_NUMBERS.each_with_index { |n, i| expect(subject.call(i + 1)).to eq(n) }
    end
  end

  describe '#prime?' do
    subject { described_class.method(:prime?) }

    it 'determines if the number is prime' do
      (0..1_000).each { |n| expect(subject.call(n)).to eq(PRIME_NUMBERS.include?(n)) }
    end
  end
end
