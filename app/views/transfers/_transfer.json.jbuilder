json.extract! transfer, :id, :from_stop_identifier, :to_stop_identifier, :transfer_type, :min_transfer_time, :from_route_identifier, :to_route_identifier, :from_trip_identifier, :to_trip_identifier, :created_at, :updated_at
json.url transfer_url(transfer, format: :json)
