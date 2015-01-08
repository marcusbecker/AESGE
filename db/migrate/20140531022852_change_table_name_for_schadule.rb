class ChangeTableNameForSchadule < ActiveRecord::Migration
  def change
    change_table :schedules do |t|
      t.rename :vehicles_id, :vehicle_id
    end    
  end
end
