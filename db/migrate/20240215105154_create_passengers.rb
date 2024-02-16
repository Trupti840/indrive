class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :last_name
      t.string :current_location
      t.string :contact_no
      t.string :email
      t.string :password
      t.string :verification_code
      t.boolean :verify

      t.timestamps
    end
  end
end
