class Subscription < ActiveRecord::Base
  attr_accessible :is_active, :phone_number
  validates_presence_of :phone_number
end
