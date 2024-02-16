class PassengersController < ApplicationController
  before_action :find_passenger, only: [:show, :update, :destroy]
  def index
    passengers = Passenger.all
  end

  def show
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      redirect_to new_passengers_path
    end
  end

  def update
  end

  def destroy
  end

  private

  def find_passenger
    @passenger = Passenger.find_by(id: params[:id])
  end

  def passenger_params
  params.require(:passenger).permit(:first_name, :last_name, :email, :contact_no)
end
end
