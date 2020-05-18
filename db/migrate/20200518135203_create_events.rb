class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :eventname
      t.string :location

      t.timestamps
    end
  end
end
