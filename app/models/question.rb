class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :question_reactions, dependent: :destroy
    validates :question, presence: true

end
