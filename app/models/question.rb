class Question < ApplicationRecord

  belongs_to :poll
  has_many :votes

  def name
    questions.object_id
  end
end
