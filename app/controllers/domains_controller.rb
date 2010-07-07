class DomainsController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
  filter_resource_access
  def edit
    edit! do |format|
      format.js { render :layout => false  }
    end
  end
end
