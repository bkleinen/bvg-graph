json.extract! agency, :id, :agency_identifier, :agency_name, :agency_url, :agency_timezone, :agency_lang, :agency_phone, :created_at, :updated_at
json.url agency_url(agency, format: :json)
