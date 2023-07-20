# app/models/customer.rb
class Customer < ApplicationRecord
  has_many :bookings
  has_many :rooms, through: :bookings

  # Атрибути
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  # Додаткові атрибути, якщо згадаю
end
