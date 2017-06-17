class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :route_identifier
      t.string :agency_identifier
      t.string :route_short_name
      t.string :route_long_name
      t.integer :route_type
      t.string :route_color
      t.string :route_text_color
      t.string :route_desc

      t.timestamps
    end
  end
end
