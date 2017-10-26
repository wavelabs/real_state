User.create_with(password: 'password', password_confirmation: 'password').find_or_create_by(email: 'admin@example.com') if Rails.env.development?

[
  "Tipo de Inmueble",
  "Alquiler Temporario",
  "Campos y Estancias",
  "Casas",
  "Casas de Vacaciones",
  "Casas Prefabricadas",
  "Countries y Barrios Cerrados",
  "Departamentos",
  "Galpones y Depósitos",
  "Habitaciones",
  "Locales Comerciales,
  Oficinas y Cocheras",
  "Negocios y Fondos de Comercio",
  "Otros",
  "Pensiones y Hospedajes",
  "Terrenos"
].each do |category_name|
  Category.find_or_create_by(name: category_name)
end
