class Room < ApplicationRecord
  belongs_to :hotel
  has_many :room_photos, dependent: :destroy

  validates :area, presence: true, numericality: { greater_than: 0 }
end
