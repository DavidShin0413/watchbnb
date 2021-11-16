class AddProperReferencesToWatches < ActiveRecord::Migration[6.0]
  def change
    remove_column :watches, :user_id, :integer
    add_reference :watches, :user, null: false, foreign_key: true
  end
end
