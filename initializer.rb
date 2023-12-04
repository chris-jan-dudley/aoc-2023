
class Initializer
  def self.run
    (1..25).each do |day|
      Dir.mkdir("day_#{day}") unless Dir.exist?("day_#{day}")
      File.open("day_#{day}/day_#{day}_input.txt", 'w') {|f| f.write("") } unless File.exist?("day_#{day}/input.txt")
      File.open("day_#{day}/day_#{day}_solution.rb", 'w')  {|f| f.write(template(day: day)) } unless File.exist?("day_#{day}/solution.rb") 
    end
  end

  private 

  def self.template(day:)
    <<-EOS
class Day#{day}
  
  def self.part_1
    File.readlines("day_#{day}/day_#{day}_input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end

  def self.part_2
    File.readlines("day_#{day}/day_#{day}_input.txt", chomp: true).each do |line|
      puts(line)
    end

    # Your code goes here
  end
end
    EOS
  end
end

Initializer.run