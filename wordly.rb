require 'colorize'

WORD_LIST = []

def fill_words(size)
  File.open(size.strip + '.txt').each { |line| WORD_LIST << line.strip.downcase }
end

def get_random_word
  rand = Random.new
  i = rand(WORD_LIST.size)
  WORD_LIST[i]
end

def get_answer_layout(answer, word)
  layout = ''

  answer.each_char.with_index do |char, i|
    layout += if char == word[i]
                char.colorize(:green)
              elsif word.include?(char)
                char.colorize(:yellow)
              else
                char.colorize(:light_black)
              end
  end

  layout.strip
end

def play_game
  word_size = 2

  loop do
    print('Введите, из скольки букв вы хотите слово (от 2 до 11): ')
    word_size = gets
    break if word_size.to_i >= 2 && word_size.to_i <= 11

    print("Введена некорректная длина. Попробуйте ещё раз.\n")
  end

  fill_words(word_size)
  word = get_random_word
  # puts format('%s -  %d ? %f', word, word.size - 1, word_size.to_i)

  puts format("\nЯ загадал слово из %s букв!", word.size)
  attempts = 0
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

  puts format('У вас %s попыток, чтобы угадать его.', max_attempts)

  loop do
    puts format("\nПопытка №%s", attempts + 1)
    puts('Предыдущие ответы:')
    for item in answers do
      puts ' ' * 19 + get_answer_layout(item, word)
    end
    print 'Введите ваш ответ: '
    input = gets.downcase.strip

    # слово равно загаданному
    if word == input
    puts format('Поздравляем, вы угадали слово %s!!!', word)
    break
    # исчерпаны все попытки
    elsif attempts == max_attempts - 1
      puts format("\nУ вас закончились попытки!\nЗагаданное слово: %s.\nПопробуйте еще раз.", word)
      break
      # размер не соответсвует нужному
    elsif input.size != word.size
      puts format('Неправильный размер введённого слова (надо: %s; ввели: %d)', word.size, input.size)
    elsif WORD_LIST.include?(input)
      attempts += 1
      answers << input
      puts format('Не верно! Осталось %s попыток.', max_attempts - attempts)
    else
      puts 'Я не знаю такого слова :(. Попробуйте ввести другое!'

    end
  end
end
