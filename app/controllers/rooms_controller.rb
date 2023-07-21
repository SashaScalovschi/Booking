# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room.hotel, notice: 'Room was successfully created.'
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
      redirect_to @room.hotel, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to @room.hotel, notice: 'Room was successfully destroyed.'
  end

  private

  def room_params
    params.require(:room).permit(:hotel_id, :area, :balcony, :tv, :air_conditioner)
  end
end
