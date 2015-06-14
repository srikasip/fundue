class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :datetime
      t.string :price
      t.string :imagepath
      t.string :pdate
      t.string :ptime
      t.text :dump

      t.timestamps
    end
  end
end
