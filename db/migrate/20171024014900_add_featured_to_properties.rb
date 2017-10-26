class AddFeaturedToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :featured, :boolean
  end
end
