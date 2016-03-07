module Api
  module V1
    class ParkingLocationsController < ApplicationController
      before_action :set_parking_location, only: [:show, :update, :destroy]
      before_action :authenticate_api_v1_user!

      # GET /parking_locations
      def index
        @parking_locations = ParkingLocation.all

        render json: @parking_locations
      end

      # GET /parking_locations/1
      def show
        render json: @parking_location
      end

      # POST /parking_locations
      def create
        @parking_location = ParkingLocation.new(parking_location_params)

        if @parking_location.save
          render json: @parking_location, status: :created, location: @parking_location
        else
          render json: @parking_location.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /parking_locations/1
      def update
        if @parking_location.update(parking_location_params)
          render json: @parking_location
        else
          render json: @parking_location.errors, status: :unprocessable_entity
        end
      end

      # DELETE /parking_locations/1
      def destroy
        @parking_location.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_parking_location
        @parking_location = ParkingLocation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def parking_location_params
        params.require(:parking_location).permit(:lat, :long, :status)
      end
    end
  end
end
