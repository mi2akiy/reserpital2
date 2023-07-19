class CreateHospitalDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :hospital_details do |t|
      t.integer :hospital_id, null: false
      t.string :name, null: false
      t.string :telephone_number, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.time :am_start_time, null: false
      t.time :am_end_time, null: false
      t.time :pm_start_time, null: false
      t.time :pm_end_time, null: false
      t.string :monday_am, null: false
      t.string :monday_pm, null: false
      t.string :tuesday_am, null: false
      t.string :tuesday_pm, null: false
      t.string :wednesday_am, null: false
      t.string :wednesday_pm, null: false
      t.string :thursday_am, null: false
      t.string :thursday_pm, null: false
      t.string :friday_am, null: false
      t.string :friday_pm, null: false
      t.string :saturday_am, null: false
      t.string :saturday_pm, null: false
      t.string :sunday_am, null: false
      t.string :sunday_pm, null: false
      t.string :holiday_am, null: false
      t.string :holiday_pm, null: false
      t.string :home_page

      t.timestamps
    end
  end
end
