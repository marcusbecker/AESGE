class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :fname
      t.string :mname
      t.string :country
      t.string :city
      t.string :uf
      t.date :birth
      t.string :email
      t.text :annotation

      t.timestamps
    end
  end
end
