
require "files_to_tables.rb"
module BVG
  def scaffold_generator(ds)
    fields = ds.fields.map{|f,t| "#{f.to_s}:#{t.to_s}"}.join(" ")
    puts "rails generate scaffold #{ds.clazz} #{fields}"
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
