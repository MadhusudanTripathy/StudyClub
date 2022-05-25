class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable 
  has_one :dashboard
  has_many :questions ,dependent: :destroy
  has_many :question_reactions, dependent: :destroy
  has_many :answers ,dependent: :destroy
  validates :user_name, uniqueness: true, presence: true
end
