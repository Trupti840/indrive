class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_no
      t.string :email
      t.boolean :covid_vaccinated
      t.string :profile_image
      t.references :passenger, foreign_key: true      
      t.timestamps
    end
  end
end
