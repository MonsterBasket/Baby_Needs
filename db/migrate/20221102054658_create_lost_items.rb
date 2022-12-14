class CreateLostItems < ActiveRecord::Migration[7.0]
  def change
    create_table :lost_items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
