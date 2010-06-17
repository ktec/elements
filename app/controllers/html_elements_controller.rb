class HtmlElementsController < ApplicationController
  # GET /html_elements
  # GET /html_elements.xml
  def index
    @html_elements = HtmlElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @html_elements }
    end
  end

  # GET /html_elements/1
  # GET /html_elements/1.xml
  def show
    @html_element = HtmlElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @html_element }
    end
  end

  # GET /html_elements/new
  # GET /html_elements/new.xml
  def new
    @html_element = HtmlElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @html_element }
    end
  end

  # GET /html_elements/1/edit
  def edit
    @html_element = HtmlElement.find(params[:id])
  end

  # POST /html_elements
  # POST /html_elements.xml
  def create
    @html_element = HtmlElement.new(params[:html_element])

    respond_to do |format|
      if @html_element.save
        format.html { redirect_to(@html_element, :notice => 'HtmlElement was successfully created.') }
        format.xml  { render :xml => @html_element, :status => :created, :location => @html_element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @html_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /html_elements/1
  # PUT /html_elements/1.xml
  def update
    @html_element = HtmlElement.find(params[:id])

    respond_to do |format|
      if @html_element.update_attributes(params[:html_element])
        format.html { redirect_to(@html_element, :notice => 'HtmlElement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @html_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /html_elements/1
  # DELETE /html_elements/1.xml
  def destroy
    @html_element = HtmlElement.find(params[:id])
    @html_element.destroy

    respond_to do |format|
      format.html { redirect_to(html_elements_url) }
      format.xml  { head :ok }
    end
  end
end
