class Customer < ActiveRecord::Base
  
  validates_presence_of :name
  
  has_many :cnhs, dependent: :destroy
  
  has_many :customer_addresses, dependent: :destroy
  has_many :addresses, through: :customer_addresses, source: :address
  
  has_many :customer_phones, dependent: :destroy
  has_many :phones, through: :customer_phones, source: :phone 
  
  
  #accepts_nested_attributes_for :customer_addresses, :allow_destroy => true
end
