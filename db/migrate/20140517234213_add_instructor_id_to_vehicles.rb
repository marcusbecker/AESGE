class AddInstructorIdToVehicles < ActiveRecord::Migration
  def change
    add_reference :vehicles, :instructor, index: true
  end
end
