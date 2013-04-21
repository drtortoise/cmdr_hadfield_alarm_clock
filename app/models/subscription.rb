class Subscription < ActiveRecord::Base
  attr_accessible :is_active, :phone_number
  validates_presence_of :phone_number

  scope :active where(:is_active => true)

  def self.make_the_calls
    active.each {|subscription| subscription.execute_phone_call }
  end

  def execute_phone_call
    client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
    call = client.account.calls.create(
      :from => '+441772441337',
      :to => self.phone_number,
      :url => latest_path
    )
  end
end
