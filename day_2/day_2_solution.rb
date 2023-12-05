class Day2

  def self.part_1(test: false)
    games = parse_game(test: test)

    games = games.reject do |_, r|
      r.select { |d| d['r'] > 12 || d['g'] > 13 || d['b'] > 14 }.any?
    end

    games.keys.map(&:to_i).sum
  end

  def self.part_2(test: false)
    games = parse_game(test: test)

    mins = games.map do |k, r|
      {
        :r_min => r.map { |h| h['r'] }.max,
        :g_min => r.map { |h| h['g'] }.max,
        :b_min => r.map { |h| h['b'] }.max,
      }
    end
    mins.map { |s| s.values.inject(:*) }.sum
  end

  private

  def self.parse_game(test: false)
    games = {}
    File.readlines("day_2/day_2_#{'test_' if test}input.txt", chomp: true).each do |line|
      key = line.strip.split(':').first.split(' ').last
      games[key] = []
      line.strip.split(':').last.split(';').each do |draw|
        dice = Hash.new(0)
        draw.split(',').each do |d|
          dice[d.split(' ').last[0]] = d.split(' ').first.to_i
        end
        games[key] << dice
      end
    end
    games
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day2.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day2.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day2.part_2(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day2.part_2}"
