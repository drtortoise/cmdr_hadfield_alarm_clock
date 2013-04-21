class Tweet < ActiveRecord::Base
  attr_accessible :body, :timestamp, :uid, :was_sent
  validates_presence_of :body, :timestamp, :uid
  validates_uniqueness_of :uid

  after_create :wake_up_subscribers

  def wake_up_subscribers
    Subscription.make_the_calls
  end
end
