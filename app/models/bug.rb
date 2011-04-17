class Bug < ActiveRecord::Base
  attr_accessible :title, :priority, :description
  
  validates :title, :presence => true
  
  validates :priority, :presence => true
  
  validates :description, :presence => true
end
