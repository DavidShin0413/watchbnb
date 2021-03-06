class AddProperReferencesToBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :user_id, :integer
    remove_column :bookings, :watch_id, :integer
    add_reference :bookings, :user, null: false, foreign_key: true
    add_reference :bookings, :watch, null: false, foreign_key: true
  end
end
