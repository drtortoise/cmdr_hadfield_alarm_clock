class Tweet < ActiveRecord::Base
  attr_accessible :body, :timestamp, :uid, :was_sent
  validates_presence_of :body, :timestamp, :uid
  validates_uniqueness_of :uid

  before_create :remove_urls_from_tweet
  after_create :wake_up_subscribers

  def remove_urls_from_tweet
    self.body.sub! /https?:\/\/[\S]+/, ''
  end

  def wake_up_subscribers
    Subscription.make_the_calls
  end
end
