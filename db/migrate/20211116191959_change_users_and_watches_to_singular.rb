class ChangeUsersAndWatchesToSingular < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :user_id, :integer
    add_column :bookings, :watch_id, :integer
    remove_column :bookings, :users_id, :integer
    remove_column :bookings, :watches_id, :integer
  end
end
