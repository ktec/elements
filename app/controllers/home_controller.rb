class HomeController < ApplicationController
  # GET /
  def index
    @featured_elements = Element.featured
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
end
