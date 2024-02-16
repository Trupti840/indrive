class AddVehicleToDriver < ActiveRecord::Migration[7.0]
  def change
    add_reference :drivers, :vehicle, foreign_key: true
  end
end
