class AddUserIdToPolls < ActiveRecord::Migration[7.0]
  def change
    add_column :polls, :user_id, :integer
    add_index :polls, :user_id
  end
end
