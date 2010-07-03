class PagesController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
  respond_to :html, :xml, :json, :js
  
  before_filter :set_etag, :only => [ :show ]
  before_filter :authenticate_user!, :only => [ :edit, :update, :destroy ]
  caches_page :index, :show
  layout :set_layout
  
  def update
    # uncomment this to display a flash message
    # flash.now[:alert] = "Hello world"
    update!
  end
  
  private
    def set_layout
      (action_name == "show"  && @page && @page.layout_name) || 'page'
    end
  protected
    #def collection
    #    @pages ||= end_of_association_chain.paginate(:page => params[:page])
    #end
    
    def set_etag
      @page = resource
      fresh_when(:etag => @page, :last_modified => @page.updated_at.utc, :public => true)
    end

    def after_save
      expire_cache
    end
    
    def expire_cache
      expire_page :action => [:index, :show]
    end
  
end