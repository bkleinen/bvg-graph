class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.string :from_stop_id
      t.string :to_stop_id
      t.integer :transfer_type
      t.integer :min_transfer_time
      t.string :from_route_identifier
      t.string :to_route_identifier
      t.string :from_trip_id
      t.string :to_trip_id

      t.timestamps
    end
  end
end
