class AddTripIndexToStopTime < ActiveRecord::Migration[5.1]
  def change
    add_index :stop_times, :trip_identifier
  end
end
