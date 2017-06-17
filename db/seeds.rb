require "import.rb"

#require "#{Rails.root}/lib/bvg-import/import.rb"
#require "#{Rails.root}/lib/bvg-import/files_to_tables.rb"

include BVG

all_ds = data_sources

puts "all data sources: "
puts all_ds.map{|ds2| ds2.clazz}

#all_ds.each {|ds| puts import_datasource(ds)}

all_ds.each {|ds| puts scaffold_generator(ds)}

all_ds.each {|ds| puts psql_copy_generator(ds)}
