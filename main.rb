require 'colorize'

WORD_LIST = Array.new
File.open('words.txt').each { |line| WORD_LIST << line }

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
                '_'.colorize(:light_black)
              end
  end

  layout.strip
end

def play_game
  word = get_random_word

  attempts = 0
  max_attempts = 7
  answer = ' '

  puts format('Слово загадано! У вас %s попыток, чтобы угадать его.', max_attempts)

  loop do
    puts format('Попытка №%s', attempts + 1)
    puts format('Предыдущий ответ: %s', get_answer_layout(answer, word))
    print 'Введите ваш ответ: '
    input = gets.chomp.downcase

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
  end
end

play_game
