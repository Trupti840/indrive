class Driver < ApplicationRecord
  belongs_to :passenger
  has_many :vehicles
  has_many :rides
  has_many :passengers, through: :rides
end
