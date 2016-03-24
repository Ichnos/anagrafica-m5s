class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :title
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
