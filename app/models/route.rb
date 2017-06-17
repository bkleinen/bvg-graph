class Route < ApplicationRecord

  def trips
    Trip.where(route_identifier: route_identifier)
  end
  def longest_trip
    length_trip_id = trips.collect {|t| [t.length, t.id]}
    max = trips.maximum("length_cache")
    longest_id = length_trip_id.select{|p| p.first == max}.first.last
    return Trip.find(longest_id)
  end
end
