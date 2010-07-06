# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :get_domain
  before_filter :set_current_user

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected

  def set_current_user
    Authorization.current_user = current_user
  end  
  
  def class_exists?(class_name)
    klass = Module.const_get(class_name)
    return klass.is_a?(Class)
  rescue NameError
    return false
  end
  
  def get_domain
    @domain ||= Domain.find_by_name(request.host)
  end
  
end
