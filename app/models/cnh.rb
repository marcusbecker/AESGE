class Cnh < ActiveRecord::Base
  
  validates_presence_of :category, :registration, :validity, :customer_id
  
  belongs_to :customer
  belongs_to :photo, dependent: :destroy
  
end
