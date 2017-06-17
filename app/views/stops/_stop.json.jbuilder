json.extract! stop, :id, :stop_identifier, :stop_code, :stop_name, :stop_desc, :stop_lat, :stop_lon, :location_type, :parent_station, :created_at, :updated_at
json.url stop_url(stop, format: :json)
