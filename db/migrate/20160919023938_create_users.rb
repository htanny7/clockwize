class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false

      t.timestamps null: false
    end

    # Make email unique
    add_index :users, :email, unique: true
  end
end
