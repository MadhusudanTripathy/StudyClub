class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable 
  has_one :dashboard
  has_many :questions ,dependent: :destroy
  has_many :question_reactions, dependent: :destroy
  has_many :answers ,dependent: :destroy
  has_many :messages
  validates :user_name, uniqueness: true, presence: true
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
end
