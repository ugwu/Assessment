require 'spec_helper'

describe BugsController do
  
  describe "POST create" do
    describe "Invalid posts requests" do
      before :each do
        @attr = {:title => nil,
                 :priority => nil,
                 :description => nil}
      end
      
      it "should not create a bug" do
        expect {
        post :create, :bug => @attr
        }.should change(Bug, :count).by(0)
      end
      
      it "should render the 'new' page" do
        post :create, :bug => @attr
        response.should render_template('new')
      end  
    end
    
    describe "Successful bug entry" do
      before :each do
        @attr = {:title => "First bug entry",
                 :priority => "P1 - Critial",
                 :description => "This is an issue discovered"}
      end
      
      it "should create a bug entry" do
        expect {
          post :create, :bug => @attr
        }.should change(Bug, :count).from(0).to(1)
      end        
    end

    describe "Update 'PUT' request" do
      before(:each) do
        @bug = Factory(:bug)
      end
      
      describe "failure update" do
        before :each do
          @attr = {:title => nil,
                     :priority => nil,
                     :description => nil}
          end
        
        it "should not allow an update with invalid data" do
          
          put :update, :id => @bug, :bug => @attr
          @bug.reload
          response.should render_template('edit')
        end
      end
      
      describe "successful update" do
        before :each do
           @attr = {:title => "First bug entry",
                    :priority => "P3 - Normal",
                    :description => "This is an issue discovered"}
        end
        
        it "should edit successully with valid data" do
           put :update, :id => @bug, :bug => @attr
           @bug.reload
           @bug.title.should  == @attr[:title]
           @bug.priority.should == @attr[:priority]
        end
        
        it "should not add another row into the database" do
          expect {
            put :update, :id => @bug, :bug => @attr
          }.should change(Bug, :count).by(0)
        end
      end
    end
    describe "Delete" do
      before(:each) do
         @bug = Factory(:bug)
      end
      
      it "should delete a user successfully" do
        expect {
          delete :destroy, :id =>@bug
        }.should change (Bug, :count).by(-1)
      end
      
      it "should render the show page after deletion" do
        delete :destroy, :id =>@bug
        response.should redirect_to(bugs_path)
      end
    end
  end
end


# expect { person.birthday!
# }.to change{person.age}.by(1)