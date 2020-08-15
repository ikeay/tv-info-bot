require 'twitter'

class TVInfoTweets
  def initialize(consumer_key, consumer_secret, access_token, access_token_secret)
    @consumer_key = consumer_key
    @consumer_secret = consumer_secret
    @access_token = access_token
    @access_token_secret = access_token_secret
    @tweets = []
  end

  def tweet(text)
    @client_rest = Twitter::REST::Client.new do |config|
      config.consumer_key = @consumer_key
      config.consumer_secret = @consumer_secret
      config.access_token = @access_token
      config.access_token_secret = @access_token_secret
    end
    @client_rest.update(text)
  end

  def tweet_all
    @tweets.each do |t|
      tweet(t)
    end
  end

  def output_all
    puts @tweets
  end

  def render_for_30_min_later(data)
    now = Time.now
    after_30_min = now + 30 * 60

    if data[:date][:start] > now && data[:date][:start] <= after_30_min
      tweet_text = MakeText.new(data[:name], data[:title], data[:channel], data[:date][:start])
      @tweets << tweet_text.for_30_min_later
    end
  end
end
