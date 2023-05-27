$:.unshift File.dirname(__FILE__)
begin
  require 'sqlite3'
rescue LoadError
  raise "Sqlite 3 is required, please install the gem as follows: sudo gem install 'sqlite3-ruby' -y"
end

require File.dirname(__FILE__) + '/random_word_generator/rwd_storage'
require File.dirname(__FILE__) + '/random_word_generator/array_ext'
require File.dirname(__FILE__) + '/random_word_generator/randomizer'

module RandomWordGenerator
  
  @db = RwdStorage.new

  # Returns a random word
  def self.word
    @db.find_random_word
  end

  # Returns a random word of a define length.
  # If no word is found in the dictionary, a random string is generated
  def self.of_length(length=8)
    word = @db.find_word_of_length(length)
    if word.nil? 
      Randomizer.random_string(length) 
    else
      word
    end
  end
  
  def self.composed(words=2, length=14, separator=' ')
    @length = length - (separator.size * (words - 1))
    minimum_word_length = 4
    lengths = Randomizer.random_lengths_matching_sum(words, @length, 4)
    lengths.map{ |wl| @db.find_word_of_length(wl) }.join(%{#{separator}})
  end
  
end