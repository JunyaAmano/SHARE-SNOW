class CreateUserPostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_post_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :user_post_id

      t.timestamps
    end
  end
end
