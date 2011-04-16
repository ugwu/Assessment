class PeopleController < ApplicationController
  def index
    @title = "Assessment"
    @persons = Person.all
    respond_to do |format|
      format.html # index.html.erb
      # format.xml  { render :xml => @users }
    end
  end

  def new
    @title = "New Person"
    @persons = Person.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @persons }
    end
  end

  def create
    @persons = Person.new(params[:person]) 
    
    respond_to do |format|
      if @persons.save
        format.html { redirect_to(@persons, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @persons, :status => :created, :location => @persons }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @persons.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @title = "Assessment"
    @persons = Person.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @persons }
    end
  end

  def edit
    @title = "Edit"
    @persons = Person.find(params[:id])
  end
  
  def update
    @persons = Person.find(params[:id])

    respond_to do |format|
      if @persons.update_attributes(params[:person])
        format.html { redirect_to(@persons, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @persons.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @persons = Person.find(params[:id])
    if @persons.id != 3
      @persons.destroy
    else
      # do nothing
    end
    
    respond_to do |format|
      format.html { redirect_to(people_url) }
    end
  end
end
