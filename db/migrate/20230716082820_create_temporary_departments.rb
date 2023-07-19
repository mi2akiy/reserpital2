class CreateTemporaryDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :temporary_departments do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
