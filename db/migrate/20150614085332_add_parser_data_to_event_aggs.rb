class AddParserDataToEventAggs < ActiveRecord::Migration
  def change
    add_column :eventaggs, :is_json, :boolean
    add_column :eventaggs, :pagination_type, :integer

  end
end
