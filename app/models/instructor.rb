class Instructor < ActiveRecord::Base
  validates_presence_of :name
  
  has_one :vehicle
  
end
