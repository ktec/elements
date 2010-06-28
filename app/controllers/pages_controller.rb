class PagesController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
  layout :set_layout
  def show
    @page = resource
    fresh_when(:etag => @page, :last_modified => @page.updated_at.utc, :public => true)
    show!
  end
  private
    def set_layout
      (action_name == "show"  && @page && @page.layout_name) || 'page'
    end
  protected
    def collection
      # @pages ||= end_of_association_chain.paginate(:page => params[:page])
    end
end