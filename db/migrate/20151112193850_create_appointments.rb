class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :phonenumber
      t.string :email, null: false
      t.datetime :scheduled_date, null: false

      t.timestamps null: false
    end
  end
end
