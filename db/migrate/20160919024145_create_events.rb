class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    # Make event belong to user
    add_reference :events, :user, index: true
  end
end
