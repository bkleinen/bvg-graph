json.extract! route, :id, :route_identifier, :agency_identifier, :route_short_name, :route_long_name, :route_type, :route_color, :route_text_color, :route_desc, :created_at, :updated_at
json.url route_url(route, format: :json)
