class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def my_bookings
    @my_bookings = Booking.all.where(record.user == user)
  end

  def my_watches_bookings

  end

  def confirm_booking

  end
  private

  def booking_params
    params.require(:bookings).permit(:id, :watch_id, :user_id, :start_date, :end_date, :accepted)
  end
end
