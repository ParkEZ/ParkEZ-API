class ParkingLocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :status, :created_by, :updated_by, :created_at, :updated_at
end
