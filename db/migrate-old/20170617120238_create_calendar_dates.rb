class CreateCalendarDates < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_dates do |t|
      t.string :service_identifier
      t.date :date
      t.string :exception_type
      t.string :integer

    end
  end
end
