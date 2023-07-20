class CreateClinicalDepartmentManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :clinical_department_managers do |t|
      t.integer :hospital_id, null: false
      t.integer :clinical_department_id, null: false

      t.timestamps
    end
  end
end
