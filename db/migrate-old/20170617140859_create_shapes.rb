class CreateShapes < ActiveRecord::Migration[5.1]
  def change
    create_table :shapes do |t|
      t.string :shape_identifier
      t.decimal :shape_pt_lat
      t.decimal :shape_pt_lon
      t.integer :shape_pt_sequence

    end
  end
end
