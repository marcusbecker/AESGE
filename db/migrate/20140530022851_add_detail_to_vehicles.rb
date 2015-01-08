class AddDetailToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :vehicle_plate, :string
    add_column :vehicles, :show_order, :integer
  end
end
