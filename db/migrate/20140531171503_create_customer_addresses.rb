class CreateCustomerAddresses < ActiveRecord::Migration
  def change
    create_table :customer_addresses do |t|
      t.references :customer, index: true
      t.references :address, index: true
      t.boolean :commercial

      t.timestamps
    end
  end
end
