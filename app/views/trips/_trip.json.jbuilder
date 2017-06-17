json.extract! trip, :id, :route_identifier, :service_identifier, :trip_identifier, :trip_headsign, :trip_short_name, :direction_identifier, :block_identifier, :shape_identifier, :created_at, :updated_at
json.url trip_url(trip, format: :json)
