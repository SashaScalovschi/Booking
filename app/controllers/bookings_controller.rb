class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @room = Room.find(params[:room_id])
  end

  def create
    @booking = Booking.new(booking_params)

    if room_available?(@booking.room, @booking.check_in_date, @booking.check_out_date) && @booking.save
      redirect_to @booking.room, notice: 'Booking was successfully created.'
    else
      flash.now[:alert] = 'The room is not available for the selected dates.'
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to @booking.room, notice: 'Booking was successfully cancelled.'
  end

  private

  def room_available?(room, check_in_date, check_out_date)
    conflicting_bookings = room.bookings.where('(check_in_date BETWEEN ? AND ?) OR (check_out_date BETWEEN ? AND ?)', check_in_date, check_out_date, check_in_date, check_out_date)
    conflicting_bookings.empty?
  end

  def booking_params
    params.require(:booking).permit(:client_id, :room_id, :check_in_date, :check_out_date)
  end
end
