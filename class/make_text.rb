class MakeText
  def initialize(name, title, channel, date)
    @name = name
    @title = title
    @channel = channel
    @date = date
  end

  def for_30_min_later
    formatted_date = "%d/%d %d:%02d" % [@date.month, @date.day, @date.hour, @date.min]

    "Botからお知らせ\n"\
    "\n"\
    "【出演情報】\n"\
    "#{@name}\n"\
    "#{formatted_date}〜\n"\
    "#{@title}\n"\
    "#{@channel}\n"\
    "\n"\
    "まもなく放送開始です！"
  end
end
