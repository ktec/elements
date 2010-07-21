class ParagraphsController < InheritedResources::Base
  actions :all
  respond_to :html, :xml, :json, :js
  before_filter :authenticate_user!, :except => [:index,:show]
  filter_resource_access
  def edit
    edit! do |format|
      format.js { render :layout => false  }
    end
  end
end