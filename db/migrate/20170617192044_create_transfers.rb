class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.string :from_stop_identifier
      t.string :to_stop_identifier
      t.integer :transfer_type
      t.integer :min_transfer_time
      t.string :from_route_identifier
      t.string :to_route_identifier
      t.string :from_trip_identifier
      t.string :to_trip_identifier

      t.timestamps
    end
  end
end
