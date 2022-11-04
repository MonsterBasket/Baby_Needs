class CreateSolutions < ActiveRecord::Migration[7.0]
  def change
    create_table :solutions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
