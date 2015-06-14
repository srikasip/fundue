class CreatePrecisionInputs < ActiveRecord::Migration
  def change
    create_table :precision_inputs do |t|
      t.integer :session_id
      t.integer :event_id
      t.string :field_name
      t.boolean :is_correct
      t.integer :how_wrong

      t.timestamps
    end
  end
end
