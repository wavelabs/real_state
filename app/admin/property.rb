ActiveAdmin.register Property do
  permit_params :name, :category_id, :featured, :address, :state, :country, :area,
                :bedrooms, :bathrooms, :year_of_build, :car_parking, :route,
                :locality, :administrative_area_level_1,
                :administrative_area_level_2, :postal_code,
                :street_number, :static_map, :operation

  scope :all
  scope :featured
  scope :active

  index do
    id_column
    column :category
    column :name
    column(:operation) { |p| I18n.t("activerecord.attributes.property/operations.#{p.operation}") if p.operation }
    column :featured
    column :active
    actions
  end

  filter :category
  filter :operation, as: :select, collection: Property.operations.keys.map { |o| [I18n.t("activerecord.attributes.property/operations.#{o}"), o] }
  filter :name

  form do |f|
    tabs do
      tab :basic do
        f.inputs do
          f.input :name
          f.input :operation, collection: Property.operations.keys.map { |o| [I18n.t("activerecord.attributes.property/operations.#{o}"), o] }
          f.input :category
          f.input :featured
        end
      end
      tab :location do
        columns do
          column do
            f.inputs do
              f.input :address, input_html: { id: 'autocomplete' }
              img id: 'static_map', src: (f.object.static_map || 'http://via.placeholder.com/280x280'), class: 'admin static-map preview'
            end
          end
          column do
            f.inputs do
              f.input :static_map, as: :hidden
              f.input :street_number, input_html: { id: 'street_number' }
              f.input :route, input_html: { id: 'route' }
              f.input :locality, input_html: { id: 'locality' }
              f.input :administrative_area_level_2, input_html: { id: 'administrative_area_level_2' }
              f.input :postal_code, input_html: { id: 'postal_code' }
              f.input :state, input_html: { id: 'administrative_area_level_1' }
              f.input :country, input_html: { id: 'country' }
            end
          end
        end
      end
      tab :details do
        f.inputs :area, :bedrooms, :bathrooms, :year_of_build, :car_parking
      end
    end
    f.actions
    script src: "https://maps.googleapis.com/maps/api/js?key=AIzaSyBJy_FqsPO7SZxzRP0aqvbSiXOKdcpnvDg&libraries=places"
  end
end
