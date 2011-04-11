require 'spec_helper'
require 'pp'

describe PeopleController do
  render_views
  
  describe "POST Create" do
    
    describe "Invalid post requests" do
      before :each do
        @attr = {:name => nil, 
                 :surname => nil, 
                 :age => nil,
                 :gender => nil,
                 :income => nil,
                 :email => nil,
                 :postcode => nil,
                 :msisdn => nil}
      end
    
      it "should not create a person" do
          lambda do
            post :create, :person => @attr
          end.should change(Person, :count).by(0)
       end
     
     it "should render the 'new' page" do
       post :create, :person => @attr
       response.should render_template('new')
     end
    end
    
    describe "Successful sign up" do
    
      before :each do
        @attr = {:name => "Oliver", 
                 :surname => "Twist", 
                 :age => 17,
                 :gender => "male",
                 :income => 35000,
                 :email => "charlesdickens@foo.com",
                 :postcode => "SW1 7ED",
                 :msisdn => "07901111111"}
      end
    
      it "should create a user and save him in the database" do
        lambda do
          post(:create, :person => @attr)
        end.should change(Person, :count).by(1)
      end
    end  
  end
  
  describe "PUT 'update'" do

    before(:each) do
      @person = Factory(:person)
    end

    describe "failure" do

      before(:each) do
         @attr = {:name => nil, :surname => nil, 
                   :age => nil, :gender => nil,
                   :income => nil, :email => nil,
                   :postcode => nil, :msisdn => nil}
      end

      it "should render the 'edit' page" do
        put :update, :id => @person, :person => @attr
        @person.reload
        response.should render_template('edit')
      end
    end
    
    describe "success" do

      before(:each) do
        @attr = {:name => "New name", :surname => "New Surname", 
                 :age => 18, :gender => "Female",
                 :income => 40000, :email => "charlesdickens@foo.com",
                 :postcode => "SW1 7ED",:msisdn => "07901111112"}
      end

      it "should change the user's attributes" do
        put :update, :id => @person, :person => @attr
        @person.reload
        @person.name.should  == @attr[:name]
        @person.email.should == @attr[:email]
      end  
    end
  end
  
  describe "DELETE" do
    
     before(:each) do
        @person = Factory(:person)
     end
     
     it "should delete the user" do
       lambda do
         delete :destroy, :id => @person
       end.should change(Person, :count).by(-1)
     end
     
     it "should redirect to the users page" do
        delete :destroy, :id => @person
        response.should redirect_to(people_path)
     end
  end
end









