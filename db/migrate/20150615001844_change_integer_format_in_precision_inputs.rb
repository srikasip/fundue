class ChangeIntegerFormatInPrecisionInputs < ActiveRecord::Migration
  def up
    change_column :precision_inputs, :how_wrong, :text
  end

  def down
    change_column :precision_inputs, :how_wrong, :integer
  end
end
