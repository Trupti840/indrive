# app/controllers/locations_controller.rb

class LocationsController < ApplicationController
  def autocomplete
    @locations = Location.where('name ILIKE ?', "%#{params[:q]}%") # Adjust the query as needed
    respond_to do |format|
      format.json { render json: @locations.to_json }
    end
  end
end
