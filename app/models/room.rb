# app/models/room.rb
class Room < ApplicationRecord
  has_many :bookings
  has_many :customers, through: :bookings

  # Атрибути
  validates :room_number, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  # Додаткові атрибути, якщо згадаю
end
