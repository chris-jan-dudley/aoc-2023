class Day14

  def part_1(test: false)
    File.readlines("day_14/day_14_#{'test_' if test}input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end

  def part_2(test: false)
    File.readlines("day_14/day_14_#{'test_' if test}input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day14.new.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day14.new.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day14.new.part_2(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day14.new.part_2}"
