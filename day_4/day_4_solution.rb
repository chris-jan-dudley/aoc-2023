class Day4

  def part_1(test: false)
    total = 0
    File.readlines("day_4/day_4_#{'test_' if test}input.txt", chomp: true).map do |line|
      winners = line.split(/[\:\|]/)[1].split(' ').map(&:to_i)
      numbers = line.split(/[\:\|]/)[2].split(' ').map(&:to_i)

      2**((winners & numbers).count - 1) if (winners & numbers).any?
    end.compact.sum
  end

  def part_2(test: false)
    File.readlines("day_4/day_4_#{'test_' if test}input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day4.new.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day4.new.part_1}"

# puts "\nPART 2"
# puts "\tTEST INPUT RESULT = #{Day4.new.part_2(test: true)}"
# puts "\tACTUAL INPUT RESULT = #{Day4.new.part_2}"
