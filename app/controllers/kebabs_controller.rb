class KebabsController < ApplicationController
  # GET /kebabs
  # GET /kebabs.xml
  def index
    @kebabs = Kebab.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kebabs }
    end
  end

  # GET /kebabs/1
  # GET /kebabs/1.xml
  def show
    @kebab = Kebab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kebab }
    end
  end

  # GET /kebabs/new
  # GET /kebabs/new.xml
  def new
    @kebab = Kebab.new
    @kebab.build_promoter
    2.times{ @kebab.transportations << Transportation.new }
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kebab }
    end
  end

  # GET /kebabs/1/edit
  def edit
    @kebab = Kebab.find(params[:id])
  end

  # POST /kebabs
  # POST /kebabs.xml
  def create
    @kebab = Kebab.new(params[:kebab])

    respond_to do |format|
      if @kebab.save
        flash[:notice] = 'Kebab was successfully created.'
        format.html { redirect_to(@kebab) }
        format.xml  { render :xml => @kebab, :status => :created, :location => @kebab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kebab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kebabs/1
  # PUT /kebabs/1.xml
  def update
    @kebab = Kebab.find(params[:id])

    respond_to do |format|
      if @kebab.update_attributes(params[:kebab])
        flash[:notice] = 'Kebab was successfully updated.'
        format.html { redirect_to(@kebab) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kebab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kebabs/1
  # DELETE /kebabs/1.xml
  def destroy
    @kebab = Kebab.find(params[:id])
    @kebab.destroy

    respond_to do |format|
      format.html { redirect_to(kebabs_url) }
      format.xml  { head :ok }
    end
  end
end
