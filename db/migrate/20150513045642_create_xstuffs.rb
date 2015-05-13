class CreateXstuffs < ActiveRecord::Migration
  def change
    create_table :xstuffs do |t|
      t.integer :eventagg_id
      t.string :xpath
      t.integer :order
      t.string :tag

      t.timestamps
    end
  end
end
