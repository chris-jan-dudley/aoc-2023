class Day6

  def part_1(test: false)
    File.readlines("day_6/day_6_#{'test_' if test}input.txt", chomp: true).each do |line|
      @times = line.split(' ')[1..-1].map(&:to_i) if line.include?('Time')
      @distances = line.split(' ')[1..-1].map(&:to_i) if line.include?('Distance')
    end

    @times.zip(@distances).map { |t, d| (1..t).select { |ms| (t - ms) * ms > d }.count }.inject(:*)
  end

  def part_2(test: false)
    File.readlines("day_6/day_6_#{'test_' if test}input.txt", chomp: true).each do |line|
      @time = line.split(' ')[1..-1].join.to_i if line.include?('Time')
      @distance = line.split(' ')[1..-1].join.to_i if line.include?('Distance')
    end

    (1..@time).select { |ms| (@time - ms) *     ms > @distance }.count
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day6.new.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day6.new.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day6.new.part_2(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day6.new.part_2}"
