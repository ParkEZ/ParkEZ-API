class CreateParkingLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_locations do |t|
      t.decimal :latitude, precision: 9, scale: 7
      t.decimal :longitude, precision: 10, scale: 7
      t.string :status
      t.belongs_to :user
      t.timestamps
    end
  end
end
