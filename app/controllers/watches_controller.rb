class WatchesController < ApplicationController
  before_action :set_watch, only: [:show, :edit, :update, :destroy]

  def index
    @watches = policy_scope(Watch).order(created_at: :desc)
  end

  def show
  end

  def new
    @watch = Watch.new
    authorize(@watch)
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user = current_user
    authorize(@watch)

    if @watch.save
      redirect_to watch_path(@watch), notice: 'Watch was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @watch.update(watch_params)
      redirect_to @watch, notice: 'Watch was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  def my_watches
    index
    @my_watches = @watches.where(record.user == user)
  end

  private

  def set_watch
    @watch = Watch.find(params[:id])
    authorize(@watch)
  end

  def watch_params
    params.require(:watch).permit(:id, :name, :style, :location, :price, :img_url)
  end
end