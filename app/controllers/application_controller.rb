class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  private

  def mobile_device?
  	request.user_agent =~ /Mobile|WebOS/
  end

  helper_method :mobile_device?
end
