class BugsController < ApplicationController
  def index
    @bug = Bug.all
    respond_to do |format|
      format.html # index.html.erb
      # format.xml  { render :xml => @users }
    end
  end
  
  def create
    @bug = Bug.new(params[:bug])
    
    respond_to do |format|
      if @bug.save
        format.html { redirect_to(@bug, :notice => 'Bug was successfully created.') }
        format.xml  { render :xml => @bug, :status => :created, :location => @persons }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bug.errors, :status => :unprocessable_entity }
      end
    end 
  end

  def new
    @bug = Bug.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bugs }
    end
  end

  def show
    @title = "Bugs"
    @bug = Bug.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bug }
    end
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update
    @bug = Bug.find(params[:id])
    
    respond_to do |format|
      if @bug.update_attributes(params[:bug])
        format.html { redirect_to(@bug, :notice => 'Bug was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bug.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    
    respond_to do |format|
      format.html { redirect_to(bugs_url) }
    end
  end

end











