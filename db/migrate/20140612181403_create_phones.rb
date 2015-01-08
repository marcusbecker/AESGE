class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :code
      t.string :number
      t.string :description

      t.timestamps
    end
  end
end
