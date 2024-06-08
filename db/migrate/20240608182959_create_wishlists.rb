class CreateWishlists < ActiveRecord::Migration[7.1]
  def change
    create_table :wishlists do |t|
      t.integer :user_id
      t.integer :coin_in
      t.datetime :date_added
      t.datetime :date_removed
      t.string :notes

      t.timestamps
    end
  end
end
