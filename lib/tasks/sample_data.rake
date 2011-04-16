require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Person.create!(:name => "Oliver", 
                 :surname => "Twist", 
                 :age => 17,
                 :gender => "male",
                 :income => 35000,
                 :email => "charlesdickens@foo.com",
                 :postcode => "SW1 7ED",
                 :msisdn => "07901111111")
    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@rubyonrails.org"
      selected = ['Male', 'Female'].shuffle
      gender  =  selected[0]
      Person.create!(:name => name, 
                   :surname => "Twist", 
                   :age => 17,
                   :gender => gender,
                   :income => 35000,
                   :email => email,
                   :postcode => "SW1 7ED",
                   :msisdn => "07901111111")
    end
  end
end
