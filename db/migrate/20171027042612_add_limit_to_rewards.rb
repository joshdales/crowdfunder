class AddLimitToRewards < ActiveRecord::Migration[5.1]
  def change
    add_column :rewards, :limit, :integer
  end
end
