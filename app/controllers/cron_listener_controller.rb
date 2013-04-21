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
    @result = Twitter.user_timeline("cmdr_hadfield", :count => 1)[0]
    uid = @result['id'].to_s
    unless Tweet.where(:uid => uid)
      body = @result['text']
      timestamp = @result['created_at']
      @tweet = Tweet.create!(:body => body, :timestamp => timestamp, :uid => uid)
    end
  end
end
