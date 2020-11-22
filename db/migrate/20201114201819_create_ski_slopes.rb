class CreateSkiSlopes < ActiveRecord::Migration[5.2]
  def change
    create_table :ski_slopes do |t|
      t.string :title
      t.string :area
      t.text :description

      t.timestamps
    end
  end
end
