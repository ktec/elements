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

end

