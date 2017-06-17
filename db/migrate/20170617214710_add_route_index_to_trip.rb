class AddRouteIndexToTrip < ActiveRecord::Migration[5.1]
  def change
    add_index :trips, :route_identifier
  end
end
