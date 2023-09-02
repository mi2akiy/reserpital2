class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :end_user_id, null: false
      t.integer :hospital_id, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.integer :status, null: false, default: "0"
      t.timestamps
    end
  end
end
