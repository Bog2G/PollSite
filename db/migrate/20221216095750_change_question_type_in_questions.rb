class ChangeQuestionTypeInQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :question, :string
  end
end