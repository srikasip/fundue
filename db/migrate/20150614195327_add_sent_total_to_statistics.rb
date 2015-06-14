class AddSentTotalToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :num_sent, :integer
  end
end
