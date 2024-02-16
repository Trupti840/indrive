class AddDeviseTwoFactorToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :otp_secret, :string
    add_column :passengers, :consumed_timestep, :integer
    add_column :passengers, :otp_required_for_login, :boolean
  end
end
