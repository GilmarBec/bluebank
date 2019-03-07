# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Routes
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
  Route.create(route)
end

## Offices

offices = [
  {name: "super_admin"},
  {name: "admin"},
  {name: "employee"}
]

offices.each do |office|
  Office.create office
end

## Operations
operations = [
	{name: "transação", code: 101}
]

operations.each do |operation|
	Operation.create operation
end

## Account Types
account_types = [
	{name: "corrente", code: 101},
	{name: "poupança", code: 102}
]

account_types.each do |account_type|
	AccountType.create account_type
end


## Employees
employees = [
	{
		name: "Administrador",
		email: "trabalhos4.5.1.4@gmail.com",
		login: "Admin",
		password: "asd123",
		password_confirmation: "asd123"
	}
]

employees.each do |employee|
	Employee.create employee
end


## Employee Relations
employee_relations = [
	{employee_id: 1, office_id: 1, address_id: 1}
]
employee_relations.each do |relation|
	EmployeeRelation.create relation
end


## Addresses
addresses = [
	{
		cep: "88106785",
		state: "SC",
		city: "São José",
		district: "Forquilhinhas",
		street: "Alguma",
		number: 649
	}
]
addresses.each do |address|
  Address.create address
end

## Agencies
agencies = [
	{number: 101, address_id: 1},
	{number: 102, address_id: 1},
	{number: 103, address_id: 1},
	{number: 104, address_id: 1}
]

agencies.each do |agency|
  Agency.create agency
end
