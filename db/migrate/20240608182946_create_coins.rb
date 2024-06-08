class CreateCoins < ActiveRecord::Migration[7.1]
  def change
    create_table :coins do |t|
      t.string :denomination
      t.string :generation
      t.integer :year
      t.string :mint

      t.timestamps
    end
  end
end
