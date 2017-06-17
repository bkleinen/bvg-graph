module BVG
  def data_sources
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

    stop_time_fields = {trip_identifier: :integer, arrival_time: :time, departure_time: :time, stop_identifier: :string, stop_sequence: :integer, pickup_type: :integer, drop_off_type: :integer, stop_headsign: :string}
    stop_time = DataSource.new('StopTime', 'db/data/stop_times.txt',stop_time_fields)
    data_sources << stop_time

    # Trip
    # "route_id","service_id","trip_id","trip_headsign","trip_short_name","direction_id","block_id","shape_id"
    # 10141_109,1,69966914,"S Wannsee Bhf","",1,,452
    # 10141_109,2,69966922,"S Wannsee Bhf","",1,,452

    trip_fields = {route_identifier: :string, service_id: :string, trip_id: :string, trip_headsign: :string, trip_short_name: :string, direction_identifier: :integer, block_identifier: :integer, shape_identifier: :integer }
    trip = DataSource.new('Trip','db/data/trips.txt',trip_fields)
    data_sources << trip


    # Route
    # "route_id","agency_id","route_short_name","route_long_name","route_type","route_color","route_text_color","route_desc"
    # 10141_109,1,"S1","",109,"","",""
    # 10142_109,1,"S1","",109,"","",""
    # 10143_109,1,"S2","",109,"","",""
    route_fields = {route_identifier: :integer, agency_identifier: :integer, route_short_name: :string,route_long_name: :string, route_type: :integer, route_color: :string, route_text_color: :string, route_desc: :string }
    route = DataSource.new('Route','db/data/routes.txt',route_fields)
    data_sources << route

    # Shape
    # "shape_id","shape_pt_lat","shape_pt_lon","shape_pt_sequence"
    # 284,52.296635,13.631472,0
    # 284,52.296640,13.631451,1

    shape_fields = {shape_identifier: :integer, shape_pt_lat: :decimal, shape_pt_lon: :decimal, shape_pt_sequence: :integer}
    shape = DataSource.new('Shape','db/data/shapes.txt',shape_fields)
    data_sources << shape

    # Transfer
    # "from_stop_id","to_stop_id","transfer_type","min_transfer_time","from_route_id","to_route_id","from_trip_id","to_trip_id"
    # 000008012716,000008012716,2,300,,,,
    # 000008012716,710009950008,2,300,,,,
    # 000008010036,060160004001,2,360,10881_100,10159_109,,
    # 000008010036,060160004001,2,360,10881_100,10162_109,,

    transfer_fields = {from_stop_id: :string, to_stop_id: :string, transfer_type: :integer,min_transfer_time: :integer, from_route_identifier: :string, to_route_identifier: :string, from_trip_id: :string, to_trip_id: :string }
    transfer = DataSource.new('Transfer','db/data/transfers.txt',transfer_fields)
    data_sources << transfer
    return data_sources
  end 
end
