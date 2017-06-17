json.extract! transfer, :id, :from_stop_id, :to_stop_id, :transfer_type, :min_transfer_time, :from_route_identifier, :to_route_identifier, :from_trip_id, :to_trip_id, :created_at, :updated_at
json.url transfer_url(transfer, format: :json)
