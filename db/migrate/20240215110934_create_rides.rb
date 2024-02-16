class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.string :location_from
      t.string :location_to
      t.datetime :date_time_when
      t.integer :offer_fare , optional: true
      t.references :passenger, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.string :confirmation_code

      t.timestamps
    end
  end
end
