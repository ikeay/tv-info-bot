require 'minitest/autorun'

require 'date'
require './class/make_text.rb'

class MakeTextTest < Minitest::Test
  def test_for_tomorrow
    expected_substring =
      "池澤あやか\n"\
      "11/17 13:05〜\n"\
      "高専ロボコン2019「関東甲信越地区大会」\n"\
      "ＮＨＫ総合１・東京(Ch.1)\n"

    text_generator = MakeText.new(
      '池澤あやか',
      '高専ロボコン2019「関東甲信越地区大会」',
      'ＮＨＫ総合１・東京(Ch.1)',
      DateTime.new(2019, 11, 17, 13, 5))

    actual_text = text_generator.for_tomorrow
    assert actual_text.include?(expected_substring)

    expected_substring2 =
      "池澤あやか\n"\
      "5/14 6:00〜\n"\
      "アーススキャナー空白地帯の謎に迫る「地図に記されない水上都市」\n"\
      "ＮＨＫ ＢＳプレミアム(Ch.3)\n"

    text_generator2 = MakeText.new(
      '池澤あやか',
      'アーススキャナー空白地帯の謎に迫る「地図に記されない水上都市」',
      'ＮＨＫ ＢＳプレミアム(Ch.3)',
      DateTime.new(2019, 5, 14, 6, 0))

    actual_text2 = text_generator2.for_tomorrow
    assert actual_text2.include?(expected_substring2)

    expected_substring3 =
      "池澤あやか\n"\
      "9/20 1:35〜\n"\
      "♯ミレニアガール<フジテレビからの!>\n"\
      "フジテレビ(Ch.8)\n"

    text_generator3 = MakeText.new(
      '池澤あやか',
      '♯ミレニアガール<フジテレビからの!>',
      'フジテレビ(Ch.8)',
      DateTime.new(2019, 9, 20, 1, 35))

    actual_text3 = text_generator3.for_tomorrow
    assert actual_text3.include?(expected_substring3)
  end

  def test_for_30_min_later
    expected_substring =
      "池澤あやか\n"\
      "11/17 13:05〜\n"\
      "高専ロボコン2019「関東甲信越地区大会」\n"\
      "ＮＨＫ総合１・東京(Ch.1)\n"

    text_generator = MakeText.new(
      '池澤あやか',
      '高専ロボコン2019「関東甲信越地区大会」',
      'ＮＨＫ総合１・東京(Ch.1)',
      DateTime.new(2019, 11, 17, 13, 5))
  
    actual_text = text_generator.for_30_min_later
    assert actual_text.include?(expected_substring)

    expected_substring2 =
      "池澤あやか\n"\
      "5/14 6:00〜\n"\
      "アーススキャナー空白地帯の謎に迫る「地図に記されない水上都市」\n"\
      "ＮＨＫ ＢＳプレミアム(Ch.3)\n"

    text_generator2 = MakeText.new(
      '池澤あやか',
      'アーススキャナー空白地帯の謎に迫る「地図に記されない水上都市」',
      'ＮＨＫ ＢＳプレミアム(Ch.3)',
      DateTime.new(2019, 5, 14, 6, 0))

    actual_text2 = text_generator2.for_30_min_later
    assert actual_text2.include?(expected_substring2)

    expected_substring3 =
      "池澤あやか\n"\
      "9/20 1:35〜\n"\
      "♯ミレニアガール<フジテレビからの!>\n"\
      "フジテレビ(Ch.8)\n"

    text_generator3 = MakeText.new(
      '池澤あやか',
      '♯ミレニアガール<フジテレビからの!>',
      'フジテレビ(Ch.8)',
      DateTime.new(2019, 9, 20, 1, 35))

    actual_text3 = text_generator3.for_30_min_later
    assert actual_text3.include?(expected_substring3)
  end
end