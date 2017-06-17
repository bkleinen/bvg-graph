class Trip < ApplicationRecord
  def stop_times
    StopTime.where(trip_identifier: trip_identifier).order("stop_sequence ASC")
  end

  def hops
    Hop.hops_from_trip(self)
  end

  def length
    unless length_cache
      self.length_cache = StopTime.where(trip_identifier: trip_identifier).count
      save
    end
    return length_cache
  end

end
