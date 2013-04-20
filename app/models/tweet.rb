class Tweet < ActiveRecord::Base
  attr_accessible :body, :timestamp, :uid, :was_sent
end
