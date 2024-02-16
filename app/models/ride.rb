class Ride < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver, optional: true
end
