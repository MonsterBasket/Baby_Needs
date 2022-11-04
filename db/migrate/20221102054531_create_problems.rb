class CreateProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :problems do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
