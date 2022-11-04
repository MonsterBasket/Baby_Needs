class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :display_name
      t.string :country
      t.string :email, null: false
      t.string :password, null: false
      t.integer :reputation

      t.timestamps
    end
  end
end
