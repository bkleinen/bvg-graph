class CreateShapes < ActiveRecord::Migration[5.1]
  def change
    create_table :shapes do |t|
      t.integer :shape_identifier
      t.decimal :shape_pt_lat
      t.decimal :shape_pt_lon
      t.integer :shape_pt_sequence

      t.timestamps
    end
  end
end
