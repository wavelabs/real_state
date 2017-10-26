class AddOperationToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :operation, :string
  end
end
