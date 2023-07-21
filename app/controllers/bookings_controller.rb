# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking.room, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to @booking.client, notice: 'Booking was successfully cancelled.'
  end

  private

  def booking_params
    params.require(:booking).permit(:client_id, :room_id, :check_in_date, :check_out_date)
  end
end
