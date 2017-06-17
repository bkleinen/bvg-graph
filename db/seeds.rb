require "#{Rails.root}/lib/bvg-import/import.rb"

data_sources = []
# CalendarDate

#rails g scaffold CalendarDate service_identifier:integer date:date exception_type: integer
#"service_id","date","exception_type"
#1,20170605,2
#1,20170608,2

calendar_date_fields = {service_identifier: :integer, date: :date, exception_type: :integer}
calendar_date = DataSource.new(CalendarDate, 'db/data/calendar_dates.txt', calendar_date_fields)
data_sources << calendar_date
#import_datasource(calendar_date)

# "agency_id","agency_name","agency_url","agency_timezone","agency_lang","agency_phone"
# 1,"S-Bahn Berlin GmbH","http://www.s-bahn-berlin.de","Europe/Berlin","de",""
# rails g scaffold Agency agency_identifier:integer agency_name:string agency_url:string agency_timezone:string agency_lang:string agency_phone:string

agency_fields =  { agency_identifier: :integer, agency_name: :string, agency_url: :string, agency_timezone: :string, agency_lang: :string, agency_phone: :string }
agency = DataSource.new(Agency, 'db/data/agency.txt', agency_fields)
data_sources << agency
#import_datasource(agency)


# Calendar
# "service_id","monday","tuesday","wednesday","thursday","friday","saturday","sunday","start_date","end_date"
# 1,1,1,1,1,1,0,0,20170531,20171209
# 2,0,0,0,0,0,1,0,20170531,20171209
#rails g scaffold Calendar service_identifier:string monday:integer tuesday:integer wednesday:integer thursday:integer friday:integer saturday:integer sunday:integer start_date:date end_date:date

calendar_fields = {service_identifier: :string, monday: :integer, tuesday: :integer, wednesday: :integer, thursday: :integer, friday: :integer, saturday: :integer, sunday: :integer, start_date: :date, end_date: :date}
calendar = DataSource.new(Calendar, 'db/data/calendar.txt',calendar_fields)
data_sources << calendar
#import_datasource(calendar)

# StopTime
# "trip_id","arrival_time","departure_time","stop_id","stop_sequence","pickup_type","drop_off_type","stop_headsign"
# 69966914,4:07:42,4:07:42,060007102721,0,0,0,""
# 69966914,4:08:54,4:09:24,060008101711,1,0,0,""

stop_time_fields = {trip_identifier: :integer, arrival_time: :time, departure_time: :time, stop_identifier: :integer, stop_sequence: :integer, pickup_type: :integer, drop_off_type: :integer, stop_headsign: :string}
stop_time = DataSource.new('StopTime', 'db/data/stop_times.txt',stop_time_fields)
data_sources << stop_time

def scaffold_generator(ds)
  fields = ds.fields.map{|f,t| "#{f.to_s}:#{t.to_s}"}.join(" ")
  puts "rails generate scaffold #{ds.clazz} #{fields}"
end
puts scaffold_generator(stop_time)

puts "all data sources: "
puts data_sources.inspect
