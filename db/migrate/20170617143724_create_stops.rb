class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.string :stop_identifier
      t.string :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.decimal :stop_lat
      t.decimal :stop_lon
      t.integer :location_type
      t.string :parent_station

      t.timestamps
    end
  end
end
