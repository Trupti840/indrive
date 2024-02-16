# db/migrate/20240215114157_add_devise_to_passengers.rb

class AddDeviseToPassengers < ActiveRecord::Migration[6.0]
  def self.up
    change_table :passengers do |t|
      # Comment out or remove the line below
      # t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      # ...
    end
    add_index :passengers, :email, unique: true
    # ...
  end

  def self.down
    # ...
  end
end
