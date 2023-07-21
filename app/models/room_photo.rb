class RoomPhoto < ApplicationRecord
  belongs_to :room
  mount_uploader :image, RoomPhotoImageUploader
end