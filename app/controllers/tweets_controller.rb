class TweetsController < ApplicationController
  def latest
    @tweet = Tweet.where('created_at > ?', Date.today.beginning_of_day + 3.hours).last
    render 'latest.xml.erb', :content_type => 'text/xml'
  end
end
