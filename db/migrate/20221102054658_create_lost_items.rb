class CreateLostItems < ActiveRecord::Migration[7.0]
  def change
    create_table :lost_items do |t|
      t.references :User, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
