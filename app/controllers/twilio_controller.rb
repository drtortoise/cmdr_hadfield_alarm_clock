class TwilioController < ApplicationController
  def voice
    @params = params
    Rails.logger.debug @params
    render 'voice.xml.erb', :content_type => 'text/xml'
  end

  def sms
    @params = params
    Rails.logger.debug @params
    render 'sms.xml.erb', :content_type => 'text/xml'
  end
end
