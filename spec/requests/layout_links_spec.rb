require 'spec_helper'

describe "LayoutLinks" do

  it "should have a People page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Assessment")
  end

  it "should have a New Person page at '/people/new'" do
    get '/people/new'
    response.should have_selector('title', :content => "New Person")
  end


  it "should have the right links on the home" do
    visit root_path
    click_link "Home"
    response.should have_selector('title', :content => "Assessment")
    click_link "Show"
    response.should have_selector('title', :content => "Assessment")
    click_link "Edit"
    response.should have_selector('title', :content => "Edit")
    click_link "Home"
    response.should have_selector('title', :content => "Assessment")
    click_link "Add a new person"
    response.should have_selector('title', :content => "New Person")
  end

end