class ReviewsController < ApplicationController
  before_action :set_watch, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.watch = @watch
    if @review.save == true
      redirect_to watch_path(@review.watch)
    else
      render :new
    end
    # redirect: message to browser, new http request. whereas render: generates html and just sends html back as response.
    # re-render the new view,
    # we have non- conditional redirect
  end

  private

  def set_watch
    @watch = Watch.find(params[:watch_id])
    authorize(@watch)
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
