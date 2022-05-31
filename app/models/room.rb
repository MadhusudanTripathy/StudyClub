class Room < ApplicationRecord
  
  validates_uniqueness_of :name
  has_many :messages, dependent: :destroy
  after_create_commit {broadcast_append_to "rooms"}

end
    