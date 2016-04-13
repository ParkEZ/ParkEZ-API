module Api
  module V1
    class ParkingLocationsController < ApplicationController
      before_action :set_parking_location, only: [:show, :update, :destroy]
      before_action :authenticate_api_v1_user!
      before_action :set_user_for_check_in, only: [:update]
      before_action :clear_user_on_check_out, only: [:update]

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
        @parking_location = ParkingLocation.create(parking_location_params)
        @parking_location.created_by = current_api_v1_user.id
        if @parking_location.save
          render json: @parking_location, status: :created
        else
          render json: @parking_location.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /parking_locations/1
      def update
        @parking_location.updated_by = current_api_v1_user.id
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

      def available_spots
        if params[:show_occupied]
          render json: ParkingLocations.close_to(params[:latitude], params[:longitude], params[:radius] || 2000).load
        else
          render json: ParkingLocation.close_to(params[:latitude], params[:longitude], params[:radius] || 2000).available.load
        end
      end

      def check_out
        ParkingLocation.unavailable.checked_in(current_api_v1_user).load.map do |p|
          p.user_id = nil
          p.status = 'free'
          p.save
        end
      end

      private

      def set_user_for_check_in
        @parking_location.user_id = current_api_v1_user.id if params[:status] == 'occupied'
      end

      def clear_user_on_check_out
        @parking_location.user_id = nil if params[:status] == 'free'
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_parking_location
        @parking_location = ParkingLocation.find(params[:id])
      end

      def set_created_by
        @parking_location.created_by = current_api_v1_user.id
      end

      def set_updated_by
        @parking_location.updated_by = current_api_v1_user.id
      end

      # Only allow a trusted parameter "white list" through.
      def parking_location_params
        params.require(:parking_location).permit(:latitude, :longitude, :status)
      end
    end
  end
end
