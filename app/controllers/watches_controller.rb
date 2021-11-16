class WatchesController < ApplicationController
  # authorize @watch
  def index
    @watches = policy_scope(Watch).order(created_at: :desc)
  end

  def show
    set_watch
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)

    if @watch.save
      redirect_to @watch, notice: 'Watch was successfully created.'
    else
      render :new
    end
  end

  def edit
    set_watch
  end

  def update
    if @watch.update(watch_params)
      redirect_to @watch, notice: 'Watch was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    set_watch
  end

  def my_watches
    index
    @my_watches = @watches.where(record.user == user)
  end

  private

  def set_watch
    @watch = Watch.find(params[:id])
  end

  def watch_params
    params.require(:watches).permit(:id, :name, :style, :location, :price, :booked, :img_url)
  end
end
