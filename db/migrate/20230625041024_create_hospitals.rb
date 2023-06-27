class CreateHospitals < ActiveRecord::Migration[6.1]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false
      t.integer :clinical_department_id, null: false
      t.string :telephone_number, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.time :am_start_time, null: false
      t.time :am_end_time, null: false
      t.time :pm_start_time, null: false
      t.time :pm_end_time, null: false
      t.integer :monday_am, null: false
      t.integer :monday_pm, null: false
      t.integer :tuesday_am, null: false
      t.integer :tuesday_pm, null: false
      t.integer :wednesday_am, null: false
      t.integer :wednesday_pm, null: false
      t.integer :thursday_am, null: false
      t.integer :thursday_pm, null: false
      t.integer :friday_am, null: false
      t.integer :friday_pm, null: false
      t.integer :saturday_am, null: false
      t.integer :saturday_pm, null: false
      t.integer :sunday_am, null: false
      t.integer :sunday_pm, null: false
      t.integer :holiday_am, null: false
      t.integer :horliday_pm, null: false
      t.string :home_page
      t.timestamps
    end
  end
end
