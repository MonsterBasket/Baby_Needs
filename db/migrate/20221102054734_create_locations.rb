class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.references :User, null: false, foreign_key: true
      t.references :LostItem, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
