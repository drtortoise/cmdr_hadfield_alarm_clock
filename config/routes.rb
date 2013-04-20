CmdrHadfieldTwitterPoller::Application.routes.draw do

  match 'incoming' => 'cron_listener#receiving_ping', :as => :incoming
  match 'latest' => 'tweets#latest', :as => :latest

  root :to => 'tweets#latest'

end
