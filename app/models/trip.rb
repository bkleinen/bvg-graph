class Trip < ApplicationRecord
  def stop_times
    StopTime.where(trip_identifier: trip_identifier)
  end
  def length
    StopTime.where(trip_identifier: trip_identifier).count
  end

end
