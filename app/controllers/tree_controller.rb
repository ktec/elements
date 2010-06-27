class TreeController < ApplicationController

  # GET /tree/children
  # POST /tree/children
  def children
    id = params[:id]
    if id == ""||id.nil?
      @elements = Element.roots
    else
      @elements = (Element.exists?(id)) ? Element.find(id).children : nil
    end
    respond_to do |format|
      format.json { render "index.json.erb" }
    end
  end

  # GET /tree
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /tree/create
  def create
    @element = Element.new
    @element.name = params[:title]
    unless params[:type].nil?
      class_name = params[:type]
      if class_exists?(class_name)
        @element.attachable = class_name.constantize.new(params)
      end
    end
    @element.parent = Element.find(params[:id]) if Element.exists?(params[:id]) 
		@element.position = params[:position]
    respond_to do |format|
      if @element.save
        format.json { render :json => { :status => "200", :id => @element.id }, :template => false }
      else
        format.json { render :json => { :status => @element.errors }, :template => false }
      end
    end
  end

  # PUT /tree/update
  def update
    respond_to do |format|
      @element = Element.find(params[:id])
      case (params[:operation])
        when "rename_node"
          @element.name = params[:title]
          if @element.save
            format.json { render :nothing => true }
          else
            format.json { render :status => @element.errors }
          end
        when "move_node"
          @ref = Element.find(params[:ref])
          @copy = params[:copy]
          if @ref.add_child(@element,params[:position])
            format.json { render :nothing => true }
          else
            format.json { render :json => { :status => :unprocessable_entity } }
          end
      end
    end
  end

  # POST /tree/destroy
  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    respond_to do |format|
      format.json { render :nothing => true }
    end
  end

end

