require "colorize"

# Словарь со словами для игры
WORD_LIST = []

# Заполнение словаря словами длины size
def fill_words(size)
  File.open("./words/" + size.strip + ".txt").each { |line| WORD_LIST << line.strip.downcase }
end

# Получение случайного слова из словаря
def get_random_word
  rand = Random.new
  i = rand(WORD_LIST.size)
  WORD_LIST[i]
end

# Вывод соответсвия введённого слова игроком по отношению к загаданному
def get_answer_layout(answer, word)
  layout = ""

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

# Возвращает количество оставшихся попыток
# после проверки соответсвия слова заданному
def check_word(answer, word, attempts)
  attempts += 1 if word == answer || WORD_LIST.include?(answer)
  attempts
end

# Пример Реализации Игры
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
    # слово равно загаданному
    if check != attempts && word == input
      puts format("Поздравляем, вы угадали слово %s!!!", word)
      break
    elsif attempts == max_attempts - 1
      puts format("\nУ вас закончились попытки!\nЗагаданное слово: %s.\nПопробуйте еще раз.", word)
      break
    # размер не соответсвует параметрам ввода
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
