require 'pp'
require 'byebug'
class Day5

  def part_1(test: false)

    almanac = {}

    File.readlines("day_5/day_5_#{'test_' if test}input.txt", chomp: true).each do |line|
      if line.match?('seeds:')
        @seeds = line.split(':')[1].split(' ').map(&:to_i)
      elsif line.match?('map:')
        @key = line.split(' ')[0]
        almanac[@key] = []
      elsif line.match(/^\d+/)
        almanac[@key] <<
          {
            :source => line.split(' ')[1].to_i,
            :destination => line.split(' ')[0].to_i,
            :range => line.split(' ')[2].to_i,
          }
      end
    end

    locations = @seeds.map do |seed|
      current_value = seed
      almanac.each do |key, maps|
        maps.each do |map|
          if (map[:source]..map[:source] + map[:range]).include?(current_value)
            current_value = current_value - map[:source] + map[:destination]
            break
          end
        end
      end
      current_value
    end

    locations.sort.first
  end

  def part_2(test: false)
    almanac = {}

    File.readlines("day_5/day_5_#{'test_' if test}input.txt", chomp: true).each do |line|
      if line.match?('seeds:')
        @seeds = line.split(':')[1].scan(/\d+\s\d+/).map do |pair| 
          ints = pair.split(' ').map(&:to_i)
          [ints[0], ints[0] + ints[1] - 1]
        end
      elsif line.match?('map:')
        @key = line.split(' ')[0]
        almanac[@key] = []
      elsif line.match(/^\d+/)
        values = line.split(' ').map(&:to_i)
        almanac[@key] <<
          {
            :from => [ values[1], values[1] + values[2] - 1 ],
            :to => [ values[0], values[0] + values[2] - 1 ],
          }
      end
    end

    source_ranges = @seeds

    almanac.each do |key, map|
      new_source_ranges = []
      source_ranges.each do |source_range|
        sub_ranges = []
        map.each do |step|
          if source_range[0] >= step[:from][0] && source_range[1] <= step[:from][1]
            from_offset = source_range[0] - step[:from][0]
            range_size = source_range[1] - source_range[0]
            sub_ranges <<
              [
                step[:to][0] + from_offset,
                step[:to][0] + from_offset + range_size
              ]
            break
          end
            
          if source_range[0] < step[:from][0] && source_range[1] <= step[:from][1] && source_range[1] >= step[:from][0]
            source_ranges <<
              [
                source_range[0],
                step[:from][0] - 1
              ]

            range_size = source_range[1] - step[:from][0]
            sub_ranges <<
              [
                step[:to][0],
                step[:to][0] + range_size
              ]
            break
          end

          if source_range[1] > step[:from][1] && source_range[0] <= step[:from][1] && source_range[0] >= step[:from][0]
            source_ranges <<
              [
                step[:from][1] + 1,
                source_range[1]
              ]

            range_size = step[:from][1] - source_range[0]
            sub_ranges <<
              [
                step[:to][1] - range_size,
                step[:to][1]
              ]
            break
          end
            
          if source_range[0] < step[:from][0] && source_range[1] > step[:from][1] 
            source_ranges <<
              [
                step[:from][1] + 1,
                source_range[1]
              ]
            source_ranges <<
              [
                source_range[0],
                step[:from][0] - 1
              ]
            sub_ranges <<
              [
                step[:to][0],
                step[:to][1]
              ]
            break
          end
        end
        sub_ranges << source_range if sub_ranges.count.zero?
        new_source_ranges += sub_ranges
      end
      source_ranges = new_source_ranges
      end  
    source_ranges.flatten.min
  end
end

puts "PART 1"
puts "\tTEST INPUT RESULT = #{Day5.new.part_1(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day5.new.part_1}"

puts "\nPART 2"
puts "\tTEST INPUT RESULT = #{Day5.new.part_2(test: true)}"
puts "\tACTUAL INPUT RESULT = #{Day5.new.part_2}"
