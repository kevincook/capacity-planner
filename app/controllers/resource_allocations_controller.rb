class ResourceAllocationsController < ApplicationController
  # GET /resource_allocations
  # GET /resource_allocations.xml
  def index
    @resource_allocations = ResourceAllocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resource_allocations }
    end
  end

  # GET /resource_allocations/1
  # GET /resource_allocations/1.xml
  def show
    @resource_allocation = ResourceAllocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resource_allocation }
    end
  end

  # GET /resource_allocations/new
  # GET /resource_allocations/new.xml
  def new
    @resource_allocation = ResourceAllocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resource_allocation }
    end
  end

  # GET /resource_allocations/1/edit
  def edit
    @resource_allocation = ResourceAllocation.find(params[:id])
  end

  # POST /resource_allocations
  # POST /resource_allocations.xml
  def create
    @resource_allocation = ResourceAllocation.new(params[:resource_allocation])

    respond_to do |format|
      if @resource_allocation.save
        flash[:notice] = 'ResourceAllocation was successfully created.'
        format.html { redirect_to(@resource_allocation) }
        format.xml  { render :xml => @resource_allocation, :status => :created, :location => @resource_allocation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resource_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resource_allocations/1
  # PUT /resource_allocations/1.xml
  def update
    @resource_allocation = ResourceAllocation.find(params[:id])

    respond_to do |format|
      if @resource_allocation.update_attributes(params[:resource_allocation])
        flash[:notice] = 'ResourceAllocation was successfully updated.'
        format.html { redirect_to(@resource_allocation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resource_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_allocations/1
  # DELETE /resource_allocations/1.xml
  def destroy
    @resource_allocation = ResourceAllocation.find(params[:id])
    @resource_allocation.destroy

    respond_to do |format|
      format.html { redirect_to(resource_allocations_url) }
      format.xml  { head :ok }
    end
  end
end
