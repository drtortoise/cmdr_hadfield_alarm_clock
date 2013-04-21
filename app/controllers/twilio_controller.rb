class TwilioController < ApplicationController
  def voice
    @params = params
    Rails.logger.debug @params
  end

  def sms
    @params = params
    Rails.logger.debug @params
  end
end
