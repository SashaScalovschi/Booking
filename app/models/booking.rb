# app/models/booking.rb
class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  # Атрибути
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  # Додаткові атрибути, якщо потрібно
end
