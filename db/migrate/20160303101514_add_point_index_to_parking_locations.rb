class AddPointIndexToParkingLocations < ActiveRecord::Migration[5.0]
  def up
    execute %{
      create index index_on_parking_locations ON parking_locations using gist (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || parking_locations.longitude || ' ' || parking_locations.latitude || ')'
        )
      )
    }
   end

  def down
    execute %(drop index index_on_parking_location)
  end
end
