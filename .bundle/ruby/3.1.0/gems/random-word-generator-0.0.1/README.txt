=Random Word Generator

The Random Word Generator is a very simple library with a very limited usage.
Its primary purpose is to generate a random string based on English dictionary words.

Born from a ruby challenge, I figured that this gem could be helpful to generate activation codes easy for people to remember.

Dependencies:
* sqlite3
* sqlite3-ruby

Usage:

Generate a random word:
  RandomWordGenerator.word
  
Generate a random word of a specific length:
  RandomWordGenerator.of_length(15)

Generate a string composed of random words where the sum of the length of the words is equal to a specific value:
  RandomWordGenerator.composed(2, 15)

Examples:

  >> require 'random_word_generator'
  true
  >> RandomWordGenerator.word
  "woozily"
  >> RandomWordGenerator.word
  "reviewable"
  >> RandomWordGenerator.of_length(15)
  "unseaworthiness"
  >> RandomWordGenerator.of_length(15)
  "downheartedness"
  >> RandomWordGenerator.of_length(7)
  "whooper"

  >> RandomWordGenerator.composed(2, 15)
  "yows woodcarver"
  >> RandomWordGenerator.composed(2, 15)
  "swamplands thew"
  >> RandomWordGenerator.composed(2, 20, '-')
  "enamelware-whitehead"
  >> RandomWordGenerator.composed(3, 27, '|')
  "floorwalker|yows|forwarders"
  
(look at the spec folder for more usage examples)