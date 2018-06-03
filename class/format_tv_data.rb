require 'date'

class FormatTVData
  def initialize(name)
    @name = name
    @pattern_title = /\[.\]/
    @pattern_channel = /\[(.+)\]/
    @pattern_start_date = /[0-9]+\/[0-9]+\s[0-9]+:[0-9]+～([0-9]+):([0-9]+)/
  end

  def get_title(input)
    input.gsub(@pattern_title, '')
  end

  def get_channel(input)
    input.match(@pattern_channel)[1]
  end

  def get_date(start_date, description)
    extract_str = description.match(@pattern_start_date)
    end_date = Time.new(
      start_date.year,
      start_date.month,
      start_date.day,
      extract_str[1].to_i,
      extract_str[2].to_i
    )
    {
      :start => start_date,
      :end => end_date
    }
  end

  def render(input)
    {
      :name => @name,
      :title => get_title(input.title),
      :channel => get_channel(input.description),
      :date => get_date(input.date, input.description),
    }
  end
end