ActiveAdmin.register Category do
  permit_params :name, :description

  index do
    id_column
    column :name
    actions
  end

  filter :name

end
