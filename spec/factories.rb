# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :person do |person|
  person.name             "Abraham"
  person.surname          "Lincon"
  person.age              56
  person.gender           "Male"
  person.income           60000
  person.email            "abrahamlincon@washington.com"
  person.postcode         "n17 8dd"
  person.msisdn          "07943666999"
end


Factory.define :bug do |bug|
  bug.title             "First bug"
  bug.priority          "P2 - High"
  bug.description       "This is the first bug"
end

