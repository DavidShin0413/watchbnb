class ReviewsController < ApplicationController
  def new
    # we need @booking in our `simple_form_for`
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `booking_id` to associate review with corresponding booking
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save == true
      redirect_to booking_path(@booking)
    else
      render :new
    end
    # redirect: message to browser, new http request. whereas render: generates html and just sends html back as response.
    # re-render the new view,
    # we have non- conditional redirect
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
