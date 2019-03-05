# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts("##Routes")

routes = [
  ## Route
  {name: "Lista de Rotas", path: "/routes", method: "get", group: "route"},         #Index
  {name: "Criar Rotas", path: "/routes", method: "post", group: "route"},           #Create
  {name: "Novo Rotas", path: "/routes/new", method: "get", group: "route"},         #New
  {name: "Editar Rotas", path: "/routes/:id/edit", method: "get", group: "route"},  #Edit
  {name: "Mostrar Rotas", path: "/routes/:id", method: "get", group: "route"},      #Show
  {name: "Atualizar Rotas", path: "/routes/:id", method: "patch", group: "route"},  #Update(patch)
  {name: "Atualizar Rotas", path: "/routes/:id", method: "put", group: "route"},    #Update(put)
  {name: "Apagar Rotas", path: "/routes/:id", method: "delete", group: "route"},    #Delete

  ##Office
  {name: "Lista de Cargos", path: "/offices", method: "get", group: "office"},      #Index
  {name: "Criar Cargo", path: "/offices", method: "post", group: "office"},         #Create
  {name: "Novo Cargo", path: "/offices/new", method: "get", group: "office"},       #New
  {name: "Editar Cargo", path: "/offices/:id/edit", method: "get", group: "office"},#Edit
  {name: "Mostrar Cargo", path: "/offices/:id", method: "get", group: "office"},    #Show
  {name: "Atualizar Cargo", path: "/offices/:id", method: "patch", group: "office"},#Update(patch)
  {name: "Atualizar Cargo", path: "/offices/:id", method: "put", group: "office"},  #Update(put)
  {name: "Apagar Cargo", path: "/offices/:id", method: "delete", group: "office"}   #Delete
]

routes.each do |route|
  tmp = Route.create(route)
  puts("Criando rotas para: "+tmp.name)
end

puts("##Office")

offices = [
  {name: "super_admin"},
  {name: "admin"},
  {name: "employee"}
]

offices.each do |office|
  tmp = Office.create office
  puts("Criando: "+tmp.name)
end

puts("##OfficeRelating")

office_relatings = []

##Super Admin
puts("Criando rotas para Super-Admin")
office_routes = Route.all
office_routes.each do |route|
  office_relatings.push({office: 1, route: route})
end

puts("Criando rotas para Admin")
##Admin
office_routes = Route.where(group: "office")
office_routes.each do |route|
  office_relatings.push({office: 2, route: route})
end

puts("Criando rotas para Employee")
##Employee
office_routes = []
office_routes.each do |route|
  office_relatings.push({office: 3, route: route})
end