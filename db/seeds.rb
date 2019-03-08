# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
	number: 101
]
