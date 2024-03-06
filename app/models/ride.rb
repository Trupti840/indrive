class Ride < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver, optional: true
  validates :location_from, :location_to, :date_time_when, presence: true
end
