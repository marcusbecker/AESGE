class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :event
      t.date :date
      t.time :time
      t.references :vehicles, index: true
      t.references :instructor, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
