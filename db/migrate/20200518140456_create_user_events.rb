class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.references :user
      t.references :event
      t.string :foodname
      t.string :foodtype
      t.string :fuel

      t.timestamps
    end
  end
end
