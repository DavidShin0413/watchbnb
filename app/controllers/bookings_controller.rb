class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :reject]

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
    @bookings_accepted = Booking.where(user: current_user, status: "accepted")
    @bookings_pending = Booking.where(user: current_user, status: "pending")
    @bookings_rejected = Booking.where(user: current_user, status: "rejected")
    authorize(@bookings_accepted)
    authorize(@bookings_pending)
    authorize(@bookings_rejected)
  end

  def accept
    @booking.accepted!
    redirect_to my_watches_bookings_path, notice: ''
  end

  def reject
    @booking.rejected!
    redirect_to my_watches_bookings_path, notice: ''
  end

  def my_watches_bookings
    watches = Watch.where(user: current_user)
    @my_watches_bookings_accepted = []
    @my_watches_bookings_rejected = []
    @my_watches_bookings_pending = []
    watches.each do |watch|
      watch_bookings = watch.bookings.to_a.flatten
      watch_bookings.each do |watch_booking|
        authorize(watch_booking)
        if watch_booking.accepted?
          @my_watches_bookings_accepted << watch_booking
        elsif watch_booking.rejected?
          @my_watches_bookings_rejected << watch_booking
        else
          @my_watches_bookings_pending << watch_booking
        end
      end
    end
    combined_bookings = @my_watches_bookings_accepted + @my_watches_bookings_rejected + @my_watches_bookings_pending
    combined_watches = combined_bookings.map { |booking| booking.watch }
    @remaining_watches = []
    watches.each { |watch| @remaining_watches << watch unless combined_watches.include?(watch) }
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize(@booking)
  end
end
