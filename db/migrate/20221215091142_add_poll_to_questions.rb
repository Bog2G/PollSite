class AddPollToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :poll_id, :integer
    add_index :questions, :poll_id
  end
end
