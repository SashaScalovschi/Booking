class RoomPhoto < ApplicationRecord
  belongs_to :room

  validates :photo, presence: true
end