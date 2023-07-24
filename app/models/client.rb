class Client < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Optional: Add custom error messages
  validates :name, presence: { message: "must be provided" }
  validates :email, presence: { message: "must be provided" },
            uniqueness: { message: "has already been taken" },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is invalid" }
end
