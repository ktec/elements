class GalleriesController < InheritedResources::Base
  filter_resource_access
  actions :all, :except => [ :new, :destroy ]
  def edit
    edit! do |format|
      format.js { render :layout => false  }
    end
  end
end
