require 'rails_helper'

RSpec.describe Api::V1::ParkingLocationsController do
  describe 'Parking Locations API' do
    it 'Does not allow un-authenticated users to see spots' do
      get '/api/v1/parking_locations'
      expect(response).to be_unauthorized
    end
  end
end
