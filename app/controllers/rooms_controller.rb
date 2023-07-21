# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @room_photos = @room.room_photos
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to admin_rooms_path, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to admin_rooms_path, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to admin_rooms_path, notice: 'Room was successfully destroyed.'
  end

  def add_photo
    @room = Room.find(params[:id])
    @room_photo = RoomPhoto.new
  end

  def create_photo
    @room = Room.find(params[:id])
    @room_photo = RoomPhoto.new(room_photo_params)
    @room_photo.room = @room

    if @room_photo.save
      redirect_to room_path(@room), notice: 'Photo was successfully uploaded.'
    else
      render :add_photo
    end
  end

  private

  def room_params
    params.require(:room).permit(:hotel_id, :area, :balcony, :tv, :air_conditioner)
  end

  def room_photo_params
    params.require(:room_photo).permit(:photo)
  end
end
