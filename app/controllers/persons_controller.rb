class PersonsController < ApplicationController
  def index
    @persons = Person.all
  end

  def new
    @persons = Person.new
  end

  def create
  end

  def show
  end

  def edit
  end

end
