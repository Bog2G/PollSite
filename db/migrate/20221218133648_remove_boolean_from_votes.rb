class RemoveBooleanFromVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes,:selected
  end
end
