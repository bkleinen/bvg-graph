class CreateCalendarDates < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_dates do |t|
      t.integer :service_identifier
      t.date :date
      t.string :exception_type
      t.string :integer

      t.timestamps
    end
  end
end
