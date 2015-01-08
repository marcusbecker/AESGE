class Vehicle < ActiveRecord::Base
  scope :by_order, -> { order('show_order') }
  
  validates_presence_of :name
  
  belongs_to :instructor
  
end
