class CustomerPhone < ActiveRecord::Base
  belongs_to :customer
  belongs_to :phone, dependent: :destroy
end
