class HomeController < ApplicationController
  # GET /
  def index
    @domain = Domain.find_by_name(request.domain)
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
end
