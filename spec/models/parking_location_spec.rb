require 'rails_helper'

RSpec.describe ParkingLocation, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:parking_location)).to be_valid
  end
  it 'is not valid with a longitude greater than 180' do
    parking_location = FactoryGirl.build(:parking_location, longitude: 181)
    expect(parking_location).to_not be_valid
  end

  it 'is not valid with a longitude less than -180' do
    parking_location = FactoryGirl.build(:parking_location, longitude: -181)
    expect(parking_location).to_not be_valid
  end

  it 'is not valid with a latitude greater than 90' do
    parking_location = FactoryGirl.build(:parking_location, latitude: 91)
    expect(parking_location).to_not be_valid
  end

  it 'is not valid with a latitude less than -90' do
    parking_location = FactoryGirl.build(:parking_location, latitude: -91)
    expect(parking_location).to_not be_valid
  end

  it 'is not valid if status is not either free or occupied' do
    expect(FactoryGirl.build(:parking_location, status: 'foobar')).to_not be_valid
  end
end
