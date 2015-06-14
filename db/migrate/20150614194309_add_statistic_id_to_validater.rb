class AddStatisticIdToValidater < ActiveRecord::Migration
  def change
    add_column :precision_inputs, :statistic_id, :integer
  end
end
