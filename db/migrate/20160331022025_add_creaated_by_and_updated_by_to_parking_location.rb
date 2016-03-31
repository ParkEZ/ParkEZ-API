class AddCreaatedByAndUpdatedByToParkingLocation < ActiveRecord::Migration[5.0]
  def up
    add_column :parking_locations, :created_by, :integer, null: true
    add_column :parking_locations, :updated_by, :integer, null: true
  end

  def down
    remove_column :parking_locations, :created_by
    remove_column :parking_locations, :updated_by
  end
end
