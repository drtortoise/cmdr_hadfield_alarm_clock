class Tweet < ActiveRecord::Base
  attr_accessible :body, :timestamp, :uid, :was_sent
  validates_presence_of :body, :timestamp, :uid
  validates_uniqueness_of :uid

  after_create :wake_up_subscribers

  def wake_up_subscribers
    # here we ping the next part of the system that has the subscribers database
    # we need it to somehow report back to let us know that tweet has been sent
    # or maybe we let it decide on its own how to handle that
  end
end
