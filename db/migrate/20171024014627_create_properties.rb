class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :country
      t.integer :area
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :year_of_build
      t.integer :car_parking

      t.timestamps
    end
  end
end
