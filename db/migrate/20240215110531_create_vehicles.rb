class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.integer :type
      t.string :vehicle_plate_no
      t.string :name
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
