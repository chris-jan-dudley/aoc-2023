
class Initializer
  def self.run
    (1..25).each do |day|
      Dir.mkdir("day_#{day}") unless Dir.exist?("day_#{day}")
      File.open("day_#{day}/day_#{day}_input.txt", 'w') {|f| f.write("") } unless File.exist?("day_#{day}/day_#{day}_input.txt")
      File.open("day_#{day}/day_#{day}_test_input.txt", 'w') {|f| f.write("") } unless File.exist?("day_#{day}/day_#{day}_test_input.txt")
      File.open("day_#{day}/day_#{day}_solution.rb", 'w')  {|f| f.write(template(day: day)) } unless File.exist?("day_#{day}/day_#{day}_solution.rb") 
    end
  end

  private 

  def self.template(day:)
    <<-EOS
class Day#{day}

  def part_1(test: false)
    File.readlines("day_#{day}/day_#{day}_\#{'test_' if test}input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end

  def part_2(test: false)
    File.readlines("day_#{day}/day_#{day}_\#{'test_' if test}input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end
end

puts "PART 1"
puts "\\tTEST INPUT RESULT = \#{Day#{day}.new.part_1(test: true)}"
puts "\\tACTUAL INPUT RESULT = \#{Day#{day}.new.part_1}"

puts "\\nPART 2"
puts "\\tTEST INPUT RESULT = \#{Day#{day}.new.part_2(test: true)}"
puts "\\tACTUAL INPUT RESULT = \#{Day#{day}.new.part_2}"
    EOS
  end
end

Initializer.run