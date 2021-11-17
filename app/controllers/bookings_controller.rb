class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @watch = Watch.find(params[:watch_id])
    authorize(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @watch = Watch.find(params[:watch_id])
    @booking.watch = @watch
    authorize(@booking)
    if @booking.save
      redirect_to my_bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
    authorize(@bookings)
  end

  def my_watches_bookings
    watches = Watch.all.where(record.user == user)
    @watches = watches.map do |watch|
      watch.user_id == record.user
    end
  end

  def confirm_booking
    if @watch.update(watch_params)
      redirect_to confirm_booking_path(@watch), notice: ''
      # else
      #   render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
