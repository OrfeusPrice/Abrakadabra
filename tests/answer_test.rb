require 'test/unit'
require_relative '../wordly'
class TestAnswerLayout < Test::Unit::TestCase
  def test_no_matches
    expected = "а".colorize(:light_black) + "а".colorize(:light_black) + "а".colorize(:light_black) + "а".colorize(:light_black) + "а".colorize(:light_black)
    assert_equal(expected, get_answer_layout("ааааа", "семья"))
  end

  def test_one_yellow_letter
    expected = "в".colorize(:light_black) + "е".colorize(:light_black) + "с".colorize(:light_black) + "н".colorize(:light_black) + "а".colorize(:yellow)
    assert_equal(expected, get_answer_layout("весна", "парад"))
  end

  def test_one_green_letter
    expected = "в".colorize(:light_black) + "е".colorize(:light_black) + "с".colorize(:green) + "н".colorize(:light_black) + "а".colorize(:light_black)
    assert_equal(expected, get_answer_layout("весна", "гость"))
  end

  def test_two_green_letters
    expected = "п".colorize(:light_black) + "о".colorize(:green) + "л".colorize(:light_black) + "е".colorize(:green)
    assert_equal(expected, get_answer_layout("поле", "море"))
  end

  def test_three_yellow_letters
    expected = "м".colorize(:light_black) + "и".colorize(:yellow) + "р".colorize(:yellow) + "а".colorize(:yellow) + "ж".colorize(:light_black)
    assert_equal(expected, get_answer_layout("мираж", "радий"))
  end

  def test_three_green_one_yellow
    expected = "п".colorize(:green) + "е".colorize(:green) + "н".colorize(:green) + "а".colorize(:yellow) + "л".colorize(:light_black)
    assert_equal(expected, get_answer_layout("пенал", "пенка"))
  end

  def test_all_matches
    expected = "к".colorize(:green) + "а".colorize(:green) + "р".colorize(:green) + "м".colorize(:green) + "а".colorize(:green)
    assert_equal(expected, get_answer_layout("карма", "карма"))
  end
end