# app/models/payment.rb
class Payment < ApplicationRecord
  belongs_to :customer

  # Атрибути
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_date, presence: true
  # Додаткові атрибути, якщо потрібно
end
