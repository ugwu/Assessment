class Person < ActiveRecord::Base
  attr_accessible :name, :surname, :age, :gender, :income, :email, :postcode, :msisdn
  
  postcode_regex = /(?i)(GIR 0AA|[A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKPS-UW])( )?[0-9][ABD-HJLNP-UW-Z]{2})/
  msisdn_regex = /07\d\d\d\d\d\d\d\d\d\Z/
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
    validates :name, :presence => true,
              :length   => { :maximum => 20 }

    validates :surname, :presence => true,
              :length   => { :maximum => 30 }
    
    validates :age, :presence => true,
              :inclusion => { :in => 16..130 }
            
    validates :gender, :presence => true
    
    # validates :income, :inclusion => { :in => 0..1000000 }
       
    validates :email, :presence => true,
              :format => {:with => email_regex}
    
    validates :postcode, :presence => true,
              :format => {:with => postcode_regex}

    validates :msisdn, :presence => true,
              :format => {:with => msisdn_regex}
end



