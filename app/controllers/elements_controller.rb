class ElementsController < InheritedResources::Base
  respond_to :html, :xml, :json
  respond_to :js, :only => :new_component
  #respond_to :iphone, :except => [ :edit, :update ]

  # this way allows us to browse via the polymorphic controllers
  #belongs_to :page,:picture,:domain, :polymorphic => true, :optional => true, :singleton => true
  # this way allows us to browse via the elements controller, but not nested polymorphic models
  #belongs_to :page, :picture, :domain, :polymorphic => true, :optional => true

  #belongs_to :domain, :singleton => true, :optional => true

  has_scope :featured, :type => :boolean
  has_scope :by_tag
  has_scope :limit, :default => 10, :only => :index
 
  def index
    @elements = apply_scopes(Element).all
  end
  
  # GET /elements/new_component
  def new_component
    @element = Element.new
    @element.build_attachable(params)
    respond_to do |format|
      format.html { render :layout => false }# new_component.html.erb
      format.js { render :layout => false, :content_type => Mime::HTML }# new_component.html.js
      format.xml  { render :xml => @element }
    end
  end
  
end
