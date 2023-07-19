class CreateClinicalDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :clinical_departments do |t|
      t.integer :hospital_id
      t.string :temporary_department_name


      t.timestamps
    end
  end
end
