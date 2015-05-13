class CreateEventaggs < ActiveRecord::Migration
  def change
    create_table :eventaggs do |t|
      t.string :name
      t.string :link
      t.integer :site_type
      t.string :pagination
      t.string :domain
      t.string :eventpage

      t.timestamps
    end
  end
end
