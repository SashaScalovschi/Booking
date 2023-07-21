class Room < ApplicationRecord
  belongs_to :hotel
  has_many :room_photos, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :area, presence: true, numericality: { greater_than: 0 }
end
