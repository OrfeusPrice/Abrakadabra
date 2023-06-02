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