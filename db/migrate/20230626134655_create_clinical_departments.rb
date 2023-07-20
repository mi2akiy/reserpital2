class CreateClinicalDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :clinical_departments do |t|
      t.string :name


      t.timestamps
    end
  end
end
