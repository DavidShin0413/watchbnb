class AddAvgRatingToWatches < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :avg_rating, :integer, default: 0
  end
end
