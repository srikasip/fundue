class CreateEventDateTimes < ActiveRecord::Migration
  def change
    create_table :event_date_times do |t|
      t.integer :event_id
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
