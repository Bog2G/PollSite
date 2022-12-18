class Poll < ApplicationRecord

  attr_accessor :question_id
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :votes
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
