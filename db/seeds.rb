require "#{Rails.root}/lib/bvg-import/import.rb"
require "#{Rails.root}/lib/bvg-import/files_to_tables.rb"

include BVG

transfer_fields = {from_stop_id: :string, to_stop_id: :string, transfer_type: :integer,min_transfer_time: :integer, from_route_identifier: :string, to_route_identifier: :string, from_trip_id: :string, to_trip_id: :string }
transfer = DataSource.new('Transfer','db/data/transfers.txt',transfer_fields)

ds = transfer
import_datasource(ds)
puts scaffold_generator(ds)

puts "all data sources: "
puts data_sources.map{|ds2| ds2.clazz}
