class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :event_id
      t.string :full_address
      t.string :city
      t.string :region

      t.timestamps
    end
  end
end
