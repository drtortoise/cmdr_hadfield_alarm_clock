class TwilioController < ApplicationController
  def voice
    @params = params
    render 'voice.xml.erb', :content_type => 'text/xml'
  end

  def voice_response
    if params[:Digits].include? "1"
      @subscription = subscribe(params[:From])
      if @subscription.save
        render 'voice_response.xml.erb', :content_type => 'text/xml'
      else
        render 'voice_response_error.xml.erb', :content_type => 'text/xml'
      end
    else
      unsubscribe params[:From]
      render 'voice_response_unsubscribed.xml.erb', :content_type => 'text/xml'
    end
  end

  def sms
    @params = params
    render 'sms.xml.erb', :content_type => 'text/xml'
  end

  def sms_response
    if params[:Body].include? "start"
      @subscription = subscribe(params[:From])
      if @subscription.save
        render 'sms_response.xml.erb', :content_type => 'text/xml'
      else
        render 'sms_response_error.xml.erb', :content_type => 'text/xml'
      end
    else
      unsubscribe params[:From]
      render 'sms_response_unsubscribed.xml.erb', :content_type => 'text/xml'
    end
  end

  private

  def subscribe phone_number
    subscription = Subscription.find_or_create_by_phone_number(params[:From])
    subscription.is_active = true
    subscription
  end

  def unsubscribe phone_number
    @subscription = Subscription.find_by_phone_number(phone_number)
    if @subscription
      @subscription.is_active = false
    end
  end

end
