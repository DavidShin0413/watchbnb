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
    watches = Watch.where(user: current_user)
    @my_watches_bookings_booked = []
    @my_watches_bookings_pending = []
    watches.each do |watch|
      watch_bookings = watch.bookings.to_a.flatten
      watch_bookings.each do |watch_booking|
        authorize(watch_booking)
        if watch_booking.accepted
          @my_watches_bookings_booked << watch_booking
        else
          @my_watches_bookings_pending << watch_booking
        end
      end
    end
    combined_bookings = @my_watches_bookings_booked + @my_watches_bookings_pending
    combined_watches = combined_bookings.map { |booking| booking.watch }
    @remaining_watches = []
    watches.each { |watch| @remaining_watches << watch unless combined_watches.include?(watch) }
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
