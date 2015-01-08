class AddAprovementToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :complete, :boolean
    add_column :schedules, :description, :string
  end
end
