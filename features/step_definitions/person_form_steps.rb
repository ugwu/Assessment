require 'pp'

Given /^a Person$/ do
  @person = Person.new
end

When /^I fill "([^"]*)" with "([^"]*)"$/ do |field, value|
  case field.to_s
    when "Name"
      @person.update_attribute(:name, value)
    when "Surname"
      @person.update_attribute(:surname, value)
    when "Age"
      @person.update_attribute(:age, value)
    when "Income"
      @person.update_attribute(:income, value)
    when "Email"
      @person.update_attribute(:email, value)
    when "Postcode"
      @person.update_attribute(:postcode, value)
    when "Msisdn"
      @person.update_attribute(:msisdn, value)
  end
end
  
When /^I select "([^"]*)" for "([^"]*)"$/ do |value, field|
   @person.update_attribute(:gender, value)
end

Then /^the person form should be valid$/ do
  Person.all.count.should == 1
end
