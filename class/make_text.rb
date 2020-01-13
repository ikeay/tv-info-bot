class MakeText
  def initialize(name, title, channel, date)
    @name = name
    @title = title
    @channel = channel
    @date = date
  end

  def random_emoji
    usable_emoji = "⭐🌟💓🌸😋😋😍😊😊🙌🙏"
    usable_emoji[Random.rand(usable_emoji.length)]
  end

  def for_tomorrow
    formatted_date = "%d/%d %d:%02d" % [@date.month, @date.day, @date.hour, @date.min]

    "こんにちは、Botです#{random_emoji()}\n"\
    "\n"\
    "【出演情報】\n"\
    "#{@name}\n"\
    "#{formatted_date}〜\n"\
    "#{@title}\n"\
    "#{@channel}\n"\
    "\n"\
    "明日、よろしくおねがいします#{random_emoji()}"
  end

  def for_30_min_later
    formatted_date = "%d/%d %d:%02d" % [@date.month, @date.day, @date.hour, @date.min]

    "こんにちは、Botです#{random_emoji()}\n"\
    "\n"\
    "【出演情報】\n"\
    "#{@name}\n"\
    "#{formatted_date}〜\n"\
    "#{@title}\n"\
    "#{@channel}\n"\
    "\n"\
    "まもなく放送開始です！みてね#{random_emoji()}"
  end
end
