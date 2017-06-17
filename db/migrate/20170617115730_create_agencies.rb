class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.integer :agency_identifier
      t.string :agency_name
      t.string :agency_url
      t.string :agency_timezone
      t.string :agency_lang
      t.string :agency_phone

      t.timestamps
    end
  end
end
