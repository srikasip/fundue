class ChangeTypeOfEvents < ActiveRecord::Migration
  def change
    def up
      change_column :events, :name, :text
      change_column :events, :location, :text
      change_column :events, :datetime, :text
      change_column :events, :imagepath, :text
      change_column :events, :source, :text
    end

    def down
      change_column :events, :name, :string
      change_column :events, :location, :string
      change_column :events, :datetime, :string
      change_column :events, :imagepath, :string
      change_column :events, :source, :string
    end
  end
end