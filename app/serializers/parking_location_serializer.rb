class ParkingLocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :status
end
