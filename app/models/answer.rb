class Answer < ApplicationRecord
  validates :answer, presence: true
  belongs_to :question
  has_many :answer_reactions, dependent: :destroy
end
  