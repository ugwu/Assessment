require 'spec_helper'
require 'pp'


describe "People" do
  
  describe "Adding new people" do
    
    it "should add a new person" do
      lambda do
          visit new_person_path
          fill_in "Name",       :with => "Tom"
          fill_in "Surname",    :with => "Cruise"
          fill_in "Age",        :with => "34"
          fill_in "Gender",     :with => "Male"
          fill_in "Income",     :with => 60000
          fill_in "Postcode",   :with => "NW1 6RD"
          fill_in "Email",      :with => "tomcruise@hollywood.com"
          fill_in "Msisdn",     :with => "07945696589"
          click_button
          response.should render_template('people/show')
      end.should change(Person, :count).by(1)      
    end
    
    it "should through an error when the a field is blank" do
       lambda do
         visit new_person_path
         fill_in "Name",       :with => "Tom"
         fill_in "Surname",    :with => "Cruise"
         fill_in "Age",        :with => nil
         fill_in "Gender",     :with => "Male"
         fill_in "Income",     :with => 60000
         fill_in "Postcode",   :with => "NW1 6RD"
         fill_in "Email",      :with => "tomcruise@hollywood.com"
         fill_in "Msisdn",     :with => "07945696589"
         click_button
         response.should render_template('people/new')
       end.should change(Person, :count).by(0)
    end
  end
end