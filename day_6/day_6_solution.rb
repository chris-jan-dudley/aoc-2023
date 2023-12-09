class Day6

  def initialize(test: false)
    File.readlines("day_6/day_6_#{'test_' if test}input.txt", chomp: true).each do |line|
      @times = line.split(' ')[1..-1].map(&:to_i) if line.include?('Time')
      @distances = line.split(' ')[1..-1].map(&:to_i) if line.include?('Distance')
    end
  end

  def part_1
    @times.zip(@distances).map { |t, d| quadratic_range(t, d) }.inject(:*)
  end

  def part_2
    quadratic_range(@times.join.to_i, @distances.join.to_i)
  end

  def quadratic_range(b, c)
    ((-b - Math.sqrt(b**2 - 4 * c)) / (-2)).ceil.pred - ((-b + Math.sqrt(b**2 - 4 * c)) / (-2)).floor.next + 1
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day6.new(test: true).part_1}"
puts "\tACTUAL INPUT RESULT = #{Day6.new.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day6.new(test: true).part_2}"
puts "\tACTUAL INPUT RESULT = #{Day6.new.part_2}"
