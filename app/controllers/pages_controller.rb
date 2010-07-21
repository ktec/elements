class PagesController < InheritedResources::Base
  actions :all
  respond_to :html, :xml, :json, :js
  before_filter :authenticate_user!, :except => [:index,:show]
  filter_resource_access
  
  before_filter :set_etag, :only => [ :show ]
  before_filter :authenticate_user!, :only => [ :edit, :update, :destroy ]
  
  before_filter :expire_page, :only => [:update,:create]
  caches_page :index
  caches_action :show
    
  #def render(*args)
  #  args.first[:layout] = false if request.xhr?
  #  super
  #end
      
  def show
    show! do |format|
      format.html { render :layout => (@page.layout_name||"page") }
    end
  end
  
  def edit
    edit! do |format|
      format.html { render :layout => "edit" }
      format.js { render :layout => false }
    end
  end
  
  private
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