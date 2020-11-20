class AddUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :image_id, :string
    add_column :events, :user_id, :integer
    add_column :events, :ski_slope_id, :integer
  end
end
