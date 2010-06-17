# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def select_type
    case (params[:type])
    when "Element"
      redirect_to(new_element_url)
    when "Article"
      redirect_to(new_article_url)
    else
      redirect_to(new_element_url)
    end
  end
end

