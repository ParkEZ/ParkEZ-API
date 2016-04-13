require 'rails_helper'

RSpec.describe Api::V1::ParkingLocationsController do
  context 'unauthenticated' do
    describe 'Parking Locations API' do
      it 'Does not allow un-authenticated users to see spots' do
        get '/api/v1/parking_locations'
        expect(response).to be_unauthorized
      end
      it "does not allow unauthenticated users to report new spots" do
        post '/api/v1/parking_locations', params: { "parking_location": { latitude: 0.0, longitude: 0.0, status: 'free' }}}
        expect(response).to be_unauthorized
      end
    end
  end
  context 'authenticated' do
    it 'shows all parking spots when authenticated' do
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
    it 'saves when reporting a new spot' do
      @user = FactoryGirl.create(:user)
      post '/api/v1/auth/sign_in', params: { email: @user.email, password: 'somethingverysecret' }
      expect(response).to be_success
      token = response.header['Access-Token']
      client = response.header['Client']
      expiry = response.header['Expiry']
      post '/api/v1/parking_locations', headers: { 'Access-Token' => token, 'Client' => client, 'Expiry' => expiry,
                                                   'Uid' => @user.email, 'Token-type' => 'Bearer' },
           params: { "parking_location": { latitude: 0.0, longitude: 0.0, status: 'free' }}
      expect(response).to be_created
      expect(JSON.parse(response.body)['created_by']).to eq @user.id
    end
  end
end
