class KebabsController < ApplicationController
  
  before_filter :authenticate
  
  # GET /kebabs
  # GET /kebabs.xml
  def index
    @kebabs = Kebab.all(:order => 'date desc')
  end

  # GET /kebabs/1
  # GET /kebabs/1.xml
  def show
    @kebab = Kebab.find(params[:id])
  end

  # GET /kebabs/new
  # GET /kebabs/new.xml
  def new
    @kebab = Kebab.new
    @kebab.build_promoter
    @kebab.transportations << Transportation.new
    @kebab.participations << Participation.new
    @kebab.comments << Comment.new
    @people = Person.all(:order => 'name asc')
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kebab }
    end
  end

  # GET /kebabs/1/edit
  def edit
    @kebab = Kebab.find(params[:id])
    @people = Person.all(:order => 'name asc')
  end

  # POST /kebabs
  # POST /kebabs.xml
  def create
    @kebab = Kebab.new(params[:kebab])

    respond_to do |format|
      if @kebab.save
        flash[:notice] = 'Kebab was successfully created.'
        format.html { redirect_to(kebabs_url) }
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
        format.html { redirect_to(kebabs_url) }
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
  
  # ajaxful_rating action
  def rate
    @kebab = Kebab.find(params[:id])
    @kebab.rate(params[:stars], current_user, params[:dimension])
    id = "ajaxful-rating-#{!params[:dimension].blank? ? "#{params[:dimension]}-" : ''}kebab-#{@kebab.id}"
    render :update do |page|
      page.replace_html id, ratings_for(@kebab, :wrap => false, :dimension => params[:dimension])
      page.visual_effect :highlight, id
    end
  end
end
