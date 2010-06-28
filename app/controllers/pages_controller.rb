class PagesController < InheritedResources::Base
  actions :all, :except => [ :new, :destroy ]
  layout :set_layout
  def show
    @page = resource
    fresh_when(:etag => @page, :last_modified => @page.updated_at.utc, :public => true)
    show!
  end
end