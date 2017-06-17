json.extract! stop_time, :id, :trip_identifier, :arrival_time, :departure_time, :stop_identifier, :stop_sequence, :pickup_type, :drop_off_type, :stop_headsign, :created_at, :updated_at
json.url stop_time_url(stop_time, format: :json)
