class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
