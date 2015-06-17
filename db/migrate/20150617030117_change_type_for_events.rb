class ChangeTypeForEvents < ActiveRecord::Migration
  def up
    change_column :events, :pdate, :text
    change_column :events, :ptime, :text
    change_column :events, :price, :text
  end

  def down
    change_column :events, :pdate, :string
    change_column :events, :ptime, :string
    change_column :events, :price, :string
  end
end
