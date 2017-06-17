
DataSource = Struct.new(:clazz,:file,:fields)

def import_datasource(ds)
  ds.clazz.destroy_all
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
        ds.clazz.create(fields)

      end
    end
  end
end

#rails g scaffold CalendarDate service_identifier:integer date:date exception_type: integer
#"service_id","date","exception_type"
#1,20170605,2
#1,20170608,2

calendar_date_fields = {service_identifier: :integer, date: :date, exception_type: :integer}
calendar_date = DataSource.new(CalendarDate, 'db/data/calendar_dates.txt', calendar_date_fields)
puts calendar_date
#import_datasource(calendar_date)

# "agency_id","agency_name","agency_url","agency_timezone","agency_lang","agency_phone"
# 1,"S-Bahn Berlin GmbH","http://www.s-bahn-berlin.de","Europe/Berlin","de",""
# rails g scaffold Agency agency_identifier:integer agency_name:string agency_url:string agency_timezone:string agency_lang:string agency_phone:string

agency_fields =  { agency_identifier: :integer, agency_name: :string, agency_url: :string, agency_timezone: :string, agency_lang: :string, agency_phone: :string }
agency = DataSource.new(Agency, 'db/data/agency.txt', agency_fields)
import_datasource(agency)


# Calendar
# "service_id","monday","tuesday","wednesday","thursday","friday","saturday","sunday","start_date","end_date"
# 1,1,1,1,1,1,0,0,20170531,20171209
# 2,0,0,0,0,0,1,0,20170531,20171209

#rails g scaffold Calendar service_identifier:string monday:integer tuesday:integer wednesday:integer thursday:integer friday:integer saturday:integer sunday:integer start_date:date end_date:date

calendar_fields = {service_identifier: :string, monday: :integer, tuesday: :integer, wednesday: :integer, thursday: :integer, friday: :integer, saturday: :integer, sunday: :integer, start_date: :date, end_date: :date}
calendar = DataSource.new(Calendar, 'db/data/calendar.txt',calendar_fields)
puts calendar
#import_datasource(calendar)
