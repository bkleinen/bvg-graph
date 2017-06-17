class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :route_identifier
      t.string :service_id
      t.string :trip_id
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_identifier
      t.integer :block_identifier
      t.integer :shape_identifier

      t.timestamps
    end
  end
end
