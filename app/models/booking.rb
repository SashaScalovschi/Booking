class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :user_id, presence: true
  validates :room_id, presence: true

  validate :check_in_date_before_check_out_date
  validate :no_overlapping_bookings

  private

  def check_in_date_before_check_out_date
    return if check_in_date.blank? || check_out_date.blank?

    errors.add(:check_in_date, "must be before check out date") if check_in_date >= check_out_date
  end

  def no_overlapping_bookings
    return if check_in_date.blank? || check_out_date.blank?

    if Booking.where(room_id: room_id)
              .where.not(id: id)
              .where("check_in_date < ? AND check_out_date > ?", check_out_date, check_in_date)
              .exists?
      errors.add(:base, "This room is already booked for the selected dates.")
    end
  end
end
