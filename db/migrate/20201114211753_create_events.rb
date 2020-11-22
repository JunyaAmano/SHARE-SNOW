class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :title
      t.datetime :departure_date
      t.datetime :return_date
      t.datetime :deadline_date
      t.integer :applicant_number
      t.integer :transportation_expense
      t.text :description
      t.boolean :is_published
      t.timestamps
    end
  end
end
