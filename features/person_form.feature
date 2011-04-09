Feature: Person form data capture

As a person 
I want my details captured correctly 
So that I can submit them

Scenario: A valid form is submitted.

Given a Person
When I fill "Name" with "Charles" 
And I fill "Surname" with "Dickens"
And I fill "Age" with "27"
And I select "Male" for "Gender"
And I fill "Income" with "35000"
And I fill "Email" with "charlesdickens@foo.com"
And I fill "Postcode" with "SW1 7ED"
And I fill "Msisdn" with "07901111111"
Then the person form should be valid
