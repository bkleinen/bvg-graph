class Trip < ApplicationRecord
  def stop_times
    StopTime.where(trip_identifier: trip_identifier)
  end
  def length
    unless length_cache
      self.length_cache = StopTime.where(trip_identifier: trip_identifier).count
      save
    end
    return length_cache
  end

end
