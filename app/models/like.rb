class Like < ApplicationRecord
  belongs_to :questions
  belongs_to :users
end
