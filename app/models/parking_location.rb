# represents a parking location
class ParkingLocation < ApplicationRecord
  self.table_name = 'parking_locations'
  validates :latitude, numericality: { greater_than_or_equal_to:  -90,
                                       less_than_or_equal_to:  90 }, presence: true
  validates :longitude, numericality: { greater_than_or_equal_to: -180,
                                        less_than_or_equal_to: 180 }, presence: true
  validates :status, inclusion: { in: %w(free occupied),
                                  message: '%{value} is not a valid status' }, allow_nil: false
  validates :user, associated: true
  scope :close_to, lambda { |latitude, longitude, _distance_in_meters = 2000|
    where(%{
    ST_DWithin(
      ST_GeographyFromText(
        'SRID=4326;POINT(' || parking_locations.longitude || ' ' || parking_locations.latitude || ')'
      ),
      ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
      %d
    )
  } % [longitude, latitude, _distance_in_meters])
  }

  scope :available, -> { where(status: 'free') }
  belongs_to :user
end
