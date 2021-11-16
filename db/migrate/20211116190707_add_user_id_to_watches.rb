class AddUserIdToWatches < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :user_id, :integer
    remove_column :watches, :users_id, :integer
  end
end
