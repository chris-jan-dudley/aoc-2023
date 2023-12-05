class Day22

  def part_1(test: false)
    File.readlines("day_22/day_22_#{'test_' if test}input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end

  def part_2(test: false)
    File.readlines("day_22/day_22_#{'test_' if test}input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day22.new.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day22.new.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day22.new.part_2(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day22.new.part_2}"
