class CreateUserPostFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_post_favorites do |t|
      t.integer :user_id
      t.integer :user_post_id

      t.timestamps
    end
  end
end
