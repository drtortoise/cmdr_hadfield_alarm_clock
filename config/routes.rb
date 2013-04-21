CmdrHadfieldTwitterPoller::Application.routes.draw do


  match 'incoming' => 'cron_listener#receiving_ping', :as => :incoming
  match 'latest' => 'tweets#latest', :as => :latest
  match 'twilio/voice' => 'twilio#voice', :via => :get
  match 'twilio/sms' => 'twilio#sms', :via => :get
  match 'twilio/voice' => 'twilio#voice_response', :via => :post
  match 'twilio/sms' => 'twilio#sms_response', :via => :post

  root :to => 'tweets#latest'

end
