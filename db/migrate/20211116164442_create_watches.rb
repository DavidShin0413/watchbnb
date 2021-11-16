class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.references :users, null: false, foreign_key: true
      t.string :name
      t.string :style
      t.string :location
      t.integer :price
      t.boolean :booked, default: false
      t.string :img_url

      t.timestamps
    end
  end
end
