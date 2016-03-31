require 'rails_helper'

RSpec.describe Api::V1::ParkingLocationsController do
  describe 'Parking Locations API' do
    it 'Does not allow un-authenticated users to see spots' do
      get '/api/v1/parking_locations'
      expect(response).to be_unauthorized
    end

    it 'authenticated users can see all parking spots' do
      @user = FactoryGirl.create(:user)
      20.times do
        FactoryGirl.create(:parking_location)
      end
      # login first
      post '/api/v1/auth/sign_in', params: { email: @user.email, password: 'somethingverysecret' }
      expect(response).to be_success
      token = response.header['Access-Token']
      client = response.header['Client']
      expiry = response.header['Expiry']
      get '/api/v1/parking_locations',
          headers: { 'Access-Token' => token, 'Client' => client, 'Expiry' => expiry,
                     'Uid' => @user.email, 'Token-type' => 'Bearer' }
      expect(response).to be_success
      expect(JSON.parse(response.body).size).to eq 20 # TODO: DRY this up
    end
  end
end
