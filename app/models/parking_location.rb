# represents a parking location
class ParkingLocation < ApplicationRecord
  validates :latitude, numericality: { greater_than_or_equal_to:  -90,
                                       less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180,
                                        less_than_or_equal_to: 180 }
  validates :status, inclusion: { in: %w(free occupied),
                                message: "%{value} is not a valid status" }, allow_nil: false
  belongs_to :user
end
