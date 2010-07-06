class PagesController < InheritedResources::Base
  filter_resource_access
  actions :all, :except => [ :new, :destroy ]
  respond_to :html, :xml, :json, :js
  
  before_filter :set_etag, :only => [ :show ]
  before_filter :authenticate_user!, :only => [ :edit, :update, :destroy ]
  layout :set_layout
  
  before_filter :expire_page, :only => [:update,:create]
  caches_page :index
  caches_action :show
      
  private
    def set_layout
      (action_name == "show"  && @page && @page.layout_name) || 'page'
    end
  protected
    #def collection
    #    @pages ||= end_of_association_chain.paginate(:page => params[:page])
    #end
    
    def set_etag
      #fresh_when(:etag => resource, :last_modified => resource.updated_at.utc, :public => true)
    end
  
    def clear_cache
      expire_page :action => :index
      expire_action :action => :show
    end

end