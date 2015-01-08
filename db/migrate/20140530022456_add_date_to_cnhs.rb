class AddDateToCnhs < ActiveRecord::Migration
  def change
    add_column :cnhs, :first_registration, :date
  end
end
