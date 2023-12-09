require 'byebug'

class Day7

  HAND_SCORES = {
    'A' => 14,
    'K' => 13,
    'Q' => 12,
    'J' => 11,
    'T' => 10,
    '9' => 9,
    '8' => 8,
    '7' => 7,
    '6' => 6,
    '5' => 5,
    '4' => 4,
    '3' => 3,
    '2' => 2
  }

  def initialize(test: false)
    @hands = []
    File.readlines("day_7/day_7_#{'test_' if test}input.txt", chomp: true).each do |line|
      @hands <<
      {
        :cards => line.split(' ')[0].chars,
        :bid => line.split(' ')[1].to_i,
      }
    end
  end

  def part_1(test: false)

    @hands.each do |hand|
      counts = Hash.new(0)
      hand[:cards].sort.each {|c| counts[c] += 1}
      hand[:counts] = counts
      hand[:hand_score] = assign_hand_score(hand[:counts].values)
    end

    sorter = (0..4).
  
    sorted = @hands.sort_by { |h| [h[:hand_score], HAND_SCORES[h[:cards][0]], HAND_SCORES[h[:cards][1]]] }#.map.with_index { |hand, i| hand[:bid] * (i + 1) }.sum

    pp sorted
  end

  def part_2(test: false)

    # Your code goes here
  end

  private

  def assign_hand_score(counts)
    return 7 if counts.include?(5)
    return 6 if counts.include?(4) 
    return 5 if counts.include?(3) && counts.include?(2)
    return 4 if counts.include?(3)
    return 3 if counts.include?(2) && counts.count == 3
    return 2 if counts.count == 4
    return 1 if counts.count == 5   
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day7.new(test: true).part_1}"
# puts "\tACTUAL INPUT RESULT = #{Day7.new.part_1}"

# puts "\nPART 2"
# puts "\tTEST INPUT RESULT = #{Day7.new(test: true).part_2}"
# puts "\tACTUAL INPUT RESULT = #{Day7.new.part_2}"
