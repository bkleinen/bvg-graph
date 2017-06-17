
require "files_to_tables.rb"
module BVG
  def scaffold_generator(ds)
    fields = ds.fields.map{|f,t| "#{f.to_s}:#{t.to_s}"}.join(" ")
    "rails generate scaffold #{ds.clazz} #{fields}"
  end

  def psql_copy_generator(ds)
  #  \copy routes(route_identifier, agency_identifier, route_short_name, route_long_name, route_type, route_color, route_text_color, route_desc) FROM '../bvg-data/routes.txt' DELIMITER ',' CSV HEADER;
    table = ds.clazz.constantize.table_name
    fields = ds.fields.map{|f,t| "#{f.to_s}"}.join(", ")
    "\\copy #{table}(#{fields})" +
    " FROM '../bvg-data/#{ds.file}' DELIMITER ',' CSV HEADER;"
  end

  def import_datasource(ds)
    clazz = ds.clazz.constantize
    clazz.destroy_all
    File.open(ds.file, "r") do |f|
      first_line = true
      f.each_line do |line|
        if first_line
          first_line = false
        else
          line_fields = line.split(',').map{|f2| f2.gsub(/(^\"|\"$)/,"")}
          puts line_fields.inspect
          fields = ds.fields.keys.zip(line_fields).to_h
           ds.fields.each do | field,field_type |
             case field_type
             when :integer
               fields[field] = fields[field].to_i
             when :date
               fields[field] = Date.parse(fields[field])
             end
           end
          puts fields.inspect
          clazz.create(fields)
        end
      end
    end
  end
end
