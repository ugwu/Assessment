require 'spec_helper'

describe Person do
  before :each do
    @attr = {:name => "Oliver", 
             :surname => "Twist", 
             :age => 12,
             :gender => "male",
             :income => 35000,
             :email => "charlesdickens@foo.com",
             :postcode => "SW1 7ED",
             :msisdn => "07901111111"}
  end
  
  describe "validation check - presence of an attribute value" do
    
    it "should validate presence of name" do
      @person = Person.new(@attr.merge(:name => nil))
      @person.should_not be_valid
    end
    
    it "should validate presence of surname" do
      @person = Person.new(@attr.merge(:surname => nil))
      @person.should_not be_valid
    end
    
    it "should validate presence of age" do
      @person = Person.new(@attr.merge(:age => nil))
      @person.should_not be_valid
    end
    
    it "should validate presence of gender" do
      @person = Person.new(@attr.merge(:gender => nil))
      @person.should_not be_valid
    end
    
    it "should validate presence of email" do
      @person = Person.new(@attr.merge(:email => nil))
      @person.should_not be_valid
    end
    
    it "should validate presence of postcode" do
      @person = Person.new(@attr.merge(:postcode => nil))
      @person.should_not be_valid
    end
    
    it "should validate presence of msisdn" do
      @person = Person.new(@attr.merge(:msisdn => nil))
      @person.should_not be_valid
    end
  end
  
  describe "Validation check - character entry" do
    
    it "should allow no more than 20 chars for name" do
       @person = Person.new(@attr.merge(:name => 'a'*21))
       @person.should_not be_valid
    end
    
    it "should allow no more than 30 chars for surname" do
      @person = Person.new(@attr.merge(:surname => 'a'*31))
      @person.should_not be_valid
    end
    
    it "should allow ages between 16 - 130" do
      [-17, 0, 15, 131].each do |age|
        @person = Person.new(@attr.merge(:age => age))
        @person.should_not be_valid
      end
    end
    
    it "should allow income between 16000 - 150000" do
      pending "validation issue"
      [-16000, -1, 0, 15999, 150001].each do |income|
        @person = Person.new(@attr.merge(:income => income))
       pp @person.should_not be_valid
                pp @person
      end
    end
    
    it "should allow only valid emails" do
      @person = Person.new(@attr.merge(:email => "charles@@foo.com"))
      @person.should_not be_valid
    end
    
    it "should allow only valid uk format postcodes" do
      @person = Person.new(@attr.merge(:postcode => "W12A ERR" ))
      @person.should_not be_valid
    end
    
    it "should allow only valid phone number formats" do
      @person = Person.new(@attr.merge(:msisdn => "0793311222"))
      @person.should_not be_valid
    end
  end
    
end



























