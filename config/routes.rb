CmdrHadfieldTwitterPoller::Application.routes.draw do


  match 'incoming' => 'cron_listener#receiving_ping', :as => :incoming
  match 'latest' => 'tweets#latest', :as => :latest
  match 'twilio/voice' => 'twilio#voice'
  match 'twilio/sms' => 'twilio#sms'

  root :to => 'tweets#latest'

end
