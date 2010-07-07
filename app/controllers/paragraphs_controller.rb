class ParagraphsController < InheritedResources::Base
  filter_resource_access
  actions :all
  def edit
    edit! do |format|
      format.js { render :layout => false  }
    end
  end
end