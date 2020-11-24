class AddSkiSlopeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ski_slope_id, :integer
  end
end
