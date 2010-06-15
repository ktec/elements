class ElementsController < ApplicationController
  # GET /elements
  # GET /elements.xml
  def index
    @elements = Element.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elements }
      format.json   { render :json => @elements.to_json }
    end
  end

  # GET /elements/tree
  def tree
    respond_to do |format|
      case (params[:operation])
      when "get_children":
        id = params[:id]
        if id == ""
          @elements = Element.roots
        else
          @elements = (Element.exists?(id)) ? Element.find(id).children : nil
        end
        format.json { render :template => "elements/tree.json.erb" }
        format.xml
        format.js { render :template => "elements/tree.json.erb", :content_type => 'text/json' }
      when "search"
      when "create_node"
        @element = Element.new
        @element.name = params[:title]
        # here we can implement some STI stuff
        # @element.type = params[:type]
        @element.parent = Element.find(params[:id])
				@element.position = params[:position]
        if @element.save
          format.json { render :json => {:status => "200", :id => @element.id} }
        else
          format.json { render :status => @element.errors }
        end
      when "remove_node"
        @element = Element.find(params[:id])
        @element.destroy
        format.json { render :nothing => true }
      when "rename_node"
        @element = Element.find(params[:id])
        @element.name = params[:title]
        if @element.save
          format.json { render :nothing => true }
        else
          format.json { render :status => @element.errors }
        end
      when "move_node"
        @element = Element.find(params[:id])
        @ref = Element.find(params[:ref])
        @copy = params[:copy]
        if @ref.add_child(@element,params[:position])
          format.json { render :nothing => true }
        else
          format.json { render :json => {:status => "50", :error => "we have a problem" } }
        end
      else
        format.html # index.html.erb
      end
    end
  end


  # GET /elements/1
  # GET /elements/1.xml
  def show
    @element = Element.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @element }
      format.json { render :json => @element.to_json }
    end
  end

  # GET /elements/new
  # GET /elements/new.xml
  def new
    @element = Element.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @element }
    end
  end

  # GET /elements/1/edit
  def edit
    @element = Element.find(params[:id])
  end

  # POST /elements
  # POST /elements.xml
  def create
    @element = Element.new(params[:element])

    respond_to do |format|
      if @element.save
        format.html { redirect_to(@element, :notice => 'Element was successfully created.') }
        format.xml  { render :xml => @element, :status => :created, :location => @element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /elements/1
  # PUT /elements/1.xml
  def update
    @element = Element.find(params[:id])

    respond_to do |format|
      if @element.update_attributes(params[:element])
        format.html { redirect_to(@element, :notice => 'Element was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.xml
  def destroy
    @element = Element.find(params[:id])
    @element.destroy

    respond_to do |format|
      format.html { redirect_to(elements_url) }
      format.xml  { head :ok }
    end
  end
end

