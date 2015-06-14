class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :total_events
      t.integer :num_addresses
      t.integer :num_pdate
      t.integer :num_ptime
      t.integer :num_price

      t.timestamps
    end
  end
end
