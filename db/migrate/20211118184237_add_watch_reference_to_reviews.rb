class AddWatchReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :watch, null: false, foreign_key: true
  end
end
