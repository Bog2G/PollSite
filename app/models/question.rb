class Question < ApplicationRecord

  belongs_to :poll
  has_many :votes

  def name
    questions.question
  end
end
