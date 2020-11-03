class AddFinishedToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :finished, :boolean, :default => false
  end
end
