# app/controllers/room_photos_controller.rb
class RoomPhotosController < ApplicationController
  def destroy
    @room_photo = RoomPhoto.find(params[:id])
    @room = @room_photo.room
    @room_photo.destroy

    redirect_to room_path(@room), notice: 'Photo was successfully deleted.'
  end
end
