require 'clockwork'
require 'active_support/time'
require 'date'
require 'dotenv/load'

require './class/format_tv_data.rb'
require './class/get_tv_info.rb'
require './class/make_text.rb'
require './class/tv_info_tweet.rb'

module Clockwork
  handler do |job|
    tweets = TVInfoTweets.new(
      ENV.fetch('TWITTER_CONSUMER_KEY'),
      ENV.fetch('TWITTER_CONSUMER_SECRET'),
      ENV.fetch('TWITTER_ACCESS_TOKEN'),
      ENV.fetch('TWITTER_ACCESS_TOKEN_SECRET')
    )
    all_data = GetTVInfo.new(ENV.fetch('PERSON_NAME')).get_all_rss()

    all_data.each do |data|
      tweets.render_for_30_min_later(data)
    end
    tweets.tweet_all
  end
  every(30.minutes, 'frequent.job')
end
