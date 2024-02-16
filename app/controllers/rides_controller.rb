class RidesController < ApplicationController
  before_action :find_ride , only: [:show, :update, :destroy]
  def index
    @rides = Ride.all
  end

  def show
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    # passenger = Passenger.find_by(confirmation_code: params[:ride][:confirmation_code])
    @ride.passenger_id = current_passenger.id
    if @ride.save
      #  available_driver = Driver.find_available_driver
      # @ride.update(driver: available_driver) if available_driver.present?
      redirect_to rides_path,  notice: 'Ride was successfully created.'
    else
      puts "#{@ride.errors.full_messages}"
      redirect_to new_ride_path
    end
  end

  def update
  end

  def destroy
  end
  
  def locations
    query = params[:q]
    # Implement logic to fetch locations based on the query (e.g., from a hardcoded list or external service)
    locations = Location.where('name LIKE ?', "%#{query}%").pluck(:name)
    render json: locations
  end
  
  private
  
  def find_ride
    @ride =Ride.find_by(id: params[:id])
  end

  def ride_params
    params.require(:ride).permit(:location_from, :location_to, :date_time_when, :offer_fare, :confirmation_code)
  end
end
