ActiveAdmin.register Agent do
  permit_params :name, :description, :role, :email, :phone, :facebook, :twitter,
                :google_plus, :linkedin, :instagram

  index do
    id_column
    column :name
    column :role
    actions
  end

  filter :name
  filter :role

  form do |f|
    tabs do
      tab :basic do
        f.inputs :name, :description, :role
      end
      tab :contact_info do
        f.inputs :email, :phone
      end
      tab :social do
        f.inputs :facebook, :twitter, :google_plus, :linkedin, :instagram
      end
    end
    f.actions
  end
end
