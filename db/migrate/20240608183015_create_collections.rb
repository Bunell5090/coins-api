class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.integer :coin_id
      t.datetime :date_aquired
      t.datetime :date_removed
      t.boolean :graded
      t.string :grading_company
      t.integer :grade
      t.string :notes

      t.timestamps
    end
  end
end
