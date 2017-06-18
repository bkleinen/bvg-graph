class Trip < ApplicationRecord
  def stop_times
    StopTime.where(trip_identifier: trip_identifier).order("stop_sequence ASC")
  end

  def hops
    Hop.hops_from_trip(self)
  end

  def shape
    Shape.where(shape_identifier: shape_identifier).first
  end

  def route
    r = Shape.connection.select_all("SELECT shape_pt_lat, shape_pt_lon FROM shapes WHERE shape_identifier = '#{shape_identifier}'")
    r.rows
  end

  def length
    unless length_cache
      self.length_cache = StopTime.where(trip_identifier: trip_identifier).count
      save
    end
    return length_cache
  end

end
