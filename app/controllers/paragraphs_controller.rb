class ParagraphsController < ApplicationController
  # GET /paragraphs
  # GET /paragraphs.xml
  def index
    @paragraphs = Paragraph.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paragraphs }
    end
  end

  # GET /paragraphs/1
  # GET /paragraphs/1.xml
  def show
    @paragraph = Paragraph.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paragraph }
    end
  end

  # GET /paragraphs/new
  # GET /paragraphs/new.xml
  def new
    @paragraph = Paragraph.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paragraph }
    end
  end

  # GET /paragraphs/1/edit
  def edit
    @paragraph = Paragraph.find(params[:id])
  end

  # POST /paragraphs
  # POST /paragraphs.xml
  def create
    @paragraph = Paragraph.new(params[:text])

    respond_to do |format|
      if @paragraph.save
        format.html { redirect_to(@paragraph, :notice => 'Paragraph was successfully created.') }
        format.xml  { render :xml => @paragraph, :status => :created, :location => @paragraph }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paragraph.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paragraphs/1
  # PUT /paragraphs/1.xml
  def update
    @paragraph = Paragraph.find(params[:id])

    respond_to do |format|
      if @paragraph.update_attributes(params[:text])
        format.html { redirect_to(@paragraph, :notice => 'Paragraph was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paragraph.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paragraphs/1
  # DELETE /paragraphs/1.xml
  def destroy
    @paragraph = Paragraph.find(params[:id])
    @paragraph.destroy

    respond_to do |format|
      format.html { redirect_to(paragraphs_url) }
      format.xml  { head :ok }
    end
  end
end

