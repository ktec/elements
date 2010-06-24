class ElementsController < InheritedResources::Base
  respond_to :html, :xml, :json
  respond_to :js, :only => :create
  #respond_to :iphone, :except => [ :edit, :update ]
    
  # GET /elements/new_component
  def new_component
    @element = Element.new
    @element.build_attachable(params)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @element }
    end
  end
  
end
