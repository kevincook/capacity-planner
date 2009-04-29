class ResourcesController < ApplicationController
  
  def index
    @resources = Resource.all
  end
  
  def show
    @resource = Resource.find(params[:id])
    respond_to do |format|
      format.html
      format.ext
    end
  end
  
  def new
    @resource = Resource.new
    respond_to do |format|
      format.html
      format.ext
    end
  end
  
  def create
    @resource = Resource.new(params[:resource])
    
    respond_to do |format|
      if @resource.save
        flash[:notice] = 'Resource was successfully created.'
        format.html { redirect_to(@resource) }
        # format.xml  { render :xml => @resource, :status => :created, :location => @resource }
        format.ext  { }
      else
        format.html { render :action => "new" }
        # format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
        format.ext  { }
      end
    end
  end
  
  def update
    @resource = Resource.find(params[:id])
    
    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        flash[:notice] = 'Resource was successfully updated.'
        format.html { redirect_to(@resource) }
        format.ext  { }
        # format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.ext  { }
        # format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # This should be enabled for the admin only...
  def destroy
    
  end
  
  def edit
    @resource = Resource.find(params[:id])
  end
  
end

