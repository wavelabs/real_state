class AddAddressDetailsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :route, :string
    add_column :properties, :locality, :string
    add_column :properties, :administrative_area_level_1, :string
    add_column :properties, :administrative_area_level_2, :string
    add_column :properties, :postal_code, :string
    add_column :properties, :street_number, :string
    add_column :properties, :static_map, :string
  end
end
