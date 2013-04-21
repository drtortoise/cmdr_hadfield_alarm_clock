class TwilioController < ApplicationController
  def voice
    @params = params
    Rails.logger.debug @params
    render 'voice.xml.erb', :content_type => 'text/xml'
  end

  def voice_response
    if params[:Digits].include? 1
      render 'voice_response.xml.erb', :content_type => 'text/xml'
    else
      render 'voice_response_unsubscribed.xml.erb', :content_type => 'text/xml'
    end
  end

  def sms
    @params = params
    Rails.logger.debug @params
    render 'sms.xml.erb', :content_type => 'text/xml'
  end

  def sms_response

  end
end
