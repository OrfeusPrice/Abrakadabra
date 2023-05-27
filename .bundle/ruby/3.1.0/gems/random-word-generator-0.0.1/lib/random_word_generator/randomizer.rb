module Randomizer

  def self.random_string(length = 8, mixed_case = true)    
    if mixed_case
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("1".."9").to_a
    else
      chars = ("a".."z").to_a + ("1".."9").to_a
    end
    Array.new(length, '').collect{chars[rand(chars.size)]}.join
  end

  # Generate random word lengths that add up to an exact amount
  # For instance, we want 3 lengths which would when added together equal 20
  # Usage: random_lengths_matching_sum(3, 20)
  # => [3,7,10]
  # You can also specify a minimum and a maximum
  # Usage: random_lengths_matching_sum(3, 20, 4, 21)
  # We want 3 lenths, a sum of 20 and the minimum number would 4 and the max 21
  def self.random_lengths_matching_sum(words=3, length=20, min=4, max=21 )
  
    min_word_length = min
    remaining_length = length
    remaining_words = nil
    random_length = nil
    total_removed = 0
    position = 0
  
    lengths = (1..words).map do |w|
      max_position = length - total_removed - (min_word_length * (remaining_words || words))
      # p "max position for split: #{max_position}"
      min_position = min_word_length
      # p "min location for split: #{min_position}"
    
      if min_position == max_position
        position = min_position
      else
        position = (min_position + rand(max_position - min_position))
      end
    
      # p "split position: #{position}"
      remaining_length = (remaining_length || length) - position
      # p "remaining length: #{remaining_length}"
      remaining_words = (remaining_words || words) - 1
      # p "remaining words: #{remaining_words}"
      total_removed = total_removed + position
      # p "removed #{total_removed}"
      # p "******"
      
      position
    end
  
    remainder = length - lengths.inject{|sum, n| sum = sum + n}
    if remainder > 0
      affected_index = rand(lengths.size)
      lengths[affected_index] = remainder + lengths[affected_index]
      # p "add #{remaining}"
    end
  
    return lengths 
  end
  
end