class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :role
      t.string :description
      t.string :phone
      t.string :email
      t.string :facebook
      t.string :twitter
      t.string :google_plus
      t.string :linkedin
      t.string :instagram

      t.timestamps
    end
  end
end
