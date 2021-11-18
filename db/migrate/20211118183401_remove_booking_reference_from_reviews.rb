class RemoveBookingReferenceFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :bookings, index: true, foreign_key: true
  end
end
