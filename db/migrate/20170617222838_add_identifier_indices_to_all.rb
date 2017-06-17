class AddIdentifierIndicesToAll < ActiveRecord::Migration[5.1]
  def change
    add_index :agencies, :agency_identifier
    add_index :calendar_dates, :service_identifier
    add_index :calendars, :service_identifier
    add_index :trips, :trip_identifier
    add_index :routes, :route_identifier
    add_index :shapes, :shape_identifier
    add_index :stops, :stop_identifier
  end
end
