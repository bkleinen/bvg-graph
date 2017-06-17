class Route < ApplicationRecord

  def trips
    Trip.where(route_identifier: route_identifier)
  end
  
end
