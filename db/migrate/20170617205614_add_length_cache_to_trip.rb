class AddLengthCacheToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :length_cache, :integer
  end
end
