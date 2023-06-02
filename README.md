# Abrakadabra


This is an implementation of the game "Wordle". The rules are the same: you have to guess the word by entering words that might fit using the game's hints. Green color means that the letter is there and is in its place. Orange color means that the letter is there, but it is not in its place. Gray color means that there is no such letter in the hidden word. The game ends if you guessed the word or if you run out of attempts

## Usage
Game implementation example
```ruby
require 'abrakadabra'

def play_game
  word_size = 2
  loop do
    print("Введите, из скольки букв вы хотите слово (от 2 до 11): ")
    word_size = gets
    break if word_size.to_i >= 2 && word_size.to_i <= 11

    print("Введена некорректная длина. Попробуйте ещё раз.\n")
  end

  fill_words(word_size)
  word = get_random_word

  puts format("\nЯ загадал слово из %s букв!", word.size)
  max_attempts = case word_size.to_i
                 when 2
                   9
                 when 3
                   8
                 when 4
                   7
                 when 5
                   6
                 when 6
                   5
                 when 7
                   4
                 when 8
                   4
                 else
                   3
                 end

  answers = []
  attempts = 0
  puts format("У вас %s попыток, чтобы угадать его.", max_attempts)

  loop do
    puts format("\nПопытка №%s", attempts + 1)
    puts("Предыдущие ответы:")
    for item in answers do
      puts " " * 19 + get_answer_layout(item, word)
    end

    print "Введите ваш ответ: "
    input = gets.downcase.strip

   
    check = check_word(input, word, attempts)
    if check != attempts && word == input
      puts format("Поздравляем, вы угадали слово %s!!!", word)
      break
    elsif attempts == max_attempts - 1
      puts format("\nУ вас закончились попытки!\nЗагаданное слово: %s.\nПопробуйте еще раз.", word)
      break
    elsif check == attempts
      puts format("Неправильный размер введённого слова (надо: %s; ввели: %d)", word.size, input.size)
      puts("Либо я не знаю такого слова!")
    else
      answers << input
      attempts = check
      puts format("Не верно! Осталось %s попыток.", max_attempts - attempts)
    end
  end
end

```

## Authors
Abrakadabra was created by a team of Ruby developers: Kalashnikova Arina, Prikhod'ko Alexey, Staren'kaya Anastasia, Tsaturyan Maria.

## License
Abrakadabra is distributed under the MIT license. See LICENSE for details.


