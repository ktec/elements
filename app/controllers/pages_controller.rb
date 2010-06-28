class PagesController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
  before_filter :set_etag, :only => [ :show ]
  caches_page :index, :show
  layout :set_layout
  private
    def set_layout
      (action_name == "show"  && @page && @page.layout_name) || 'page'
    end
  protected
    def collection
      # @pages ||= end_of_association_chain.paginate(:page => params[:page])
    end
    def set_etag
      @page = resource
      fresh_when(:etag => @page, :last_modified => @page.updated_at.utc, :public => true)
    end
end