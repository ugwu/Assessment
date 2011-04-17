require 'spec_helper'

describe Bug do
  before :each do
    @attr = {:title => "Edit link is broken",
             :priority => "P1 - Critical",
             :description => "On the home page, click on the edit link and it breaks"}
  end
  
  describe "Validation" do
    
    describe "Ensure presence of data" do
      it "should validate the presence of a title" do
        @bug = Bug.new(@attr.merge(:title => nil))
        @bug.should_not be_valid
      end
      
      it "should validate the presence of a priority" do
        @bug = Bug.new(@attr.merge(:priority => nil))
        @bug.should_not be_valid
      end
      
      it "should validate the presence of a description" do
        @bug = Bug.new(@attr.merge(:description => nil))
        @bug.should_not be_valid
      end
    end
    
    describe "Insertion of data into the bug table" do
      it "should accept validate data into the bug table" do
        @bug = Bug.create!(@attr)
        @bug.should be_valid
      end
    end
  end 
end
