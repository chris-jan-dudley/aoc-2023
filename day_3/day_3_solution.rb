require 'pry'

class Day3

  def part_1(test: false)
input = []
    File.readlines("day_3/day_3_#{'test_' if test}input.txt", chomp: true).each do |line|
      input << line
    end

    total = 0

    input.each_with_index do |line, index|
      line.enum_for(:scan, /\d+/).map { Regexp.last_match.begin(0) }.zip(line.scan(/\d+/)).each do |i, num|
        before = i > 0 ? line[i-1] : nil
        after = i < (line.length - 1) ? line[i+num.length] : nil

        above = index > 0 ? (input[index - 1] || '')[[i-1, 0 ].max..[i+num.length, line.length - 1 ].min] : nil
        below = index < input.size - 1 ? (input[index + 1] || '')[[i-1, 0 ].max..[i+num.length, line.length - 1].min] : nil

        total += num.to_i if symbol(before) || symbol(after) || symbol(above) || symbol(below) 
      end
    end
    total
  end

  def part_2(test: false)
@input = []
    File.readlines("day_3/day_3_#{'test_' if test}input.txt", chomp: true).each do |line|
      @input << line
    end

    total = 0

    @input.each_with_index do |line, index|
      line.enum_for(:scan, /\*/).map { Regexp.last_match.begin(0) }.zip(line.scan(/\*/)).each do |i, num|
        h_near = find_near(line, i)
        above_near = find_near(@input[index - 1], i)
        below_near = find_near(@input[index + 1], i)

        total += (h_near + above_near + below_near).inject(:*) if (h_near + above_near + below_near).length == 2
      end
    end

    total
  end

  private 

  def find_near(line, gear_index)
    nums = []
    line.enum_for(:scan, /\d+/).map { Regexp.last_match.begin(0) }.zip(line.scan(/\d+/)).each do |i, num|
      nums << num.to_i if (i-1..i+num.length).include?(gear_index)
    end
    nums
  end

  def symbol(string)
    return false unless string

    string.scan(/\W/).reject { |c| c=='.' }.any?
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day3.new.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day3.new.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day3.new.part_2(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day3.new.part_2}"
