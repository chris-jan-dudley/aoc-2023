require 'pry'
class Day1

  def self.part_1(test: false)
total = 0
    File.readlines("day_1/day_1_#{'test_' if test}input.txt", chomp: true).each do |line|
      int_l = line.to_s.downcase.gsub(/[a-z]/, '')
      total += ((int_l&.chars&.first || '' ) + (int_l&.chars&.last || '')).to_i
    end

    total 
  end

  def self.part_2(test: false)
    word_digits = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9' }
    word_tokens_regex = /#{word_digits.keys.join('|')}/
    digit_tokens_regex = /#{word_digits.values.join('|')}/
    word_digit_tokens_regex = /#{word_tokens_regex}|#{digit_tokens_regex}/
    word_digit_tokens_with_lookup_regex = /(?=(#{word_digit_tokens_regex}))/

    total = 0

    File.readlines("day_1/day_1_#{'part_2_test_' if test}input.txt", chomp: true).each do |line|
      tokens = line.scan(word_digit_tokens_with_lookup_regex).map { |t| word_digits.values.include?(t.first) ? t.first : word_digits[t.first] }.compact
      total += (tokens.first + tokens.last).to_i
    end

    total
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day1.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day1.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day1.part_2(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day1.part_2}"
