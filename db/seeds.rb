# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

routes = [
    #access
    {name: "Lista de cargos", path: "/access"}, # Index access
    {name: "Mostrar cargo", path: "/access/:id"}, # Show access
    {name: "Criar cargo", path: "/access/new"}, # New access
    {name: "Editar cargo", path: "/access/edit/:id"}, # Edit access
    {name: "Deletar cargo", path: "/access/delete/:id"} # Delete access
]

routes.each do |route|
  tmp = Route.create(route)
  puts("Criado(a) "+tmp.name)
end