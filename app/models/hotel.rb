class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :contact_info, presence: true
end
