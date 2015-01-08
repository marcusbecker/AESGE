class CreateCnhs < ActiveRecord::Migration
  def change
    create_table :cnhs do |t|
      t.string :category
      t.string :registration
      t.boolean :first
      t.date :validity
      t.references :customer, index: true

      t.timestamps
    end
  end
end
