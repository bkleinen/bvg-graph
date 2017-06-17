class StopTime < ApplicationRecord
  paginates_per 50
  def stop
    Stop.where(stop_identifier: stop_identifier).first
  end
end
