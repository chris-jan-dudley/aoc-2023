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
    cards = {}
    File.readlines("day_4/day_4_#{'test_' if test}input.txt", chomp: true).each do |line|
      winners = splitter(line, 1).map(&:to_i)
      numbers = splitter(line, 2).map(&:to_i)

      cards[splitter(line, 0).last.to_i] = 
        { 
          :count => 1,
          :winning_numbers => (winners & numbers).length
        }
    end

    cards.each do |card, data|
      data[:count].times { |_| (1..data[:winning_numbers]).each { |i| cards[card + i][:count] += 1 } }
    end
     
    cards.map { |card, data| data[:count] }.sum
  end

  private

  def splitter(line, index)
    line.split(/[\:\|]/)[index].split(' ')
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day4.new.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day4.new.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day4.new.part_2(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day4.new.part_2}"
