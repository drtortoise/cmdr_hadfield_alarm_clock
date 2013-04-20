class CronListenerController < ApplicationController
  def receiving_ping
    @tweet = Tweet.where('created_at > ? AND was_sent IS TRUE', Date.today.beginning_of_day + 3.hours).last
    unless @tweet
      poll_twitter
    end
    respond_to :html
  end

  private

  def poll_twitter
    # TODO make sure it's not a tweet we've already got
    tweet = Twitter.user_timeline("cmdr_hadfield", :count => 1)[0]
    uid = tweet['id'].to_s
    unless Tweet.where(:uid => uid)
      body = tweet['text']
      timestamp = tweet['created_at']
      Tweet.create(:body => body, :timestamp => timestamp, :uid => uid)
    end
  end
end
