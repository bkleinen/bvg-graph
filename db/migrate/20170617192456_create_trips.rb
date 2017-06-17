class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :route_identifier
      t.string :service_identifier
      t.string :trip_identifier
      t.string :trip_headsign
      t.string :trip_short_name
      t.string :direction_identifier
      t.string :block_identifier
      t.string :shape_identifier

      t.timestamps
    end
  end
end
