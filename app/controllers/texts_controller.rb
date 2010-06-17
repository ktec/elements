class TextsController < ApplicationController
  # GET /texts
  # GET /texts.xml
  def index
    @texts = Text.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @texts }
    end
  end

  # GET /texts/1
  # GET /texts/1.xml
  def show
    @text = Text.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @text }
    end
  end

  # GET /texts/new
  # GET /texts/new.xml
  def new
    @text = Text.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @text }
    end
  end

  # GET /texts/1/edit
  def edit
    @text = Text.find(params[:id])
  end

  # POST /texts
  # POST /texts.xml
  def create
    @text = Text.new(params[:text])

    respond_to do |format|
      if @text.save
        format.html { redirect_to(@text, :notice => 'Text was successfully created.') }
        format.xml  { render :xml => @text, :status => :created, :location => @text }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.xml
  def update
    @text = Text.find(params[:id])

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to(@text, :notice => 'Text was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.xml
  def destroy
    @text = Text.find(params[:id])
    @text.destroy

    respond_to do |format|
      format.html { redirect_to(texts_url) }
      format.xml  { head :ok }
    end
  end
end
