require 'colorize'

WORD_LIST = []
File.open('words.txt').each { |line| WORD_LIST << line }
for w in WORD_LIST
  w.downcase
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
  end
  word = get_random_word
  # puts format('%s -  %d ? %f', word, word.size - 1, word_size.to_i)
  if word.size != word_size.to_i + 1
    loop do
      word = get_random_word
      # puts format('%s -  %d ? %f', word, word.size - 1, word_size.to_i)
      break if word.size == word_size.to_i + 1
    end
  end

  puts format('Я загадал слово из %s букв!', word.size - 1)
  attempts = 0
  max_attempts = 7
  answer = ' '

  puts format('У вас %s попыток, чтобы угадать его.', max_attempts)

  loop do
    puts format('Попытка №%s', attempts + 1)
    puts format('Предыдущий ответ: %s', get_answer_layout(answer, word))
    print 'Введите ваш ответ: '
    input = gets
    # puts input.size - 1
    if WORD_LIST.include?(input.downcase) && input.size == word.size
      if input == word.downcase
        puts format('Поздравляем, вы угадали слово %s!!!', word)
        break
      elsif attempts == max_attempts - 1
        puts format('У вас закончились попытки! Слово было %s. Попробуйте еще раз.', word)
        break
      else
        attempts += 1
        answer = input
        puts format('Не верно! Осталось %s попыток.', max_attempts - attempts)
      end
    else
      puts format(
        'Либо не то кол-во букв (надо: %s, ввели: %d), либо я не знаю такого слова :(, попробуйте ввести другое.', word.size - 1, input.size - 1
      )
    end
  end
end

play_game
