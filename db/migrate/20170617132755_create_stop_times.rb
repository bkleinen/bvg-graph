class CreateStopTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :stop_times do |t|
      t.string :trip_identifier
      t.time :arrival_time
      t.time :departure_time
      t.string :stop_identifier
      t.integer :stop_sequence
      t.integer :pickup_type
      t.integer :drop_off_type
      t.string :stop_headsign

    end
  end
end
