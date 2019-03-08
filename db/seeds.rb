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
		agency: "104",
		office: "Desenvolvedor",
		login: "Admin",
		password: "asd123",
		password_confirmation: "asd123"
	}
]

employees.each do |employee|
	Employee.create employee
end

accounts = [
	{
		name: "Gilmar",
		cpf: "00000000000",
		agency: "104",
		number: 000000,
		password: "Admin123",
		current_amount: 30000,
		credit: 2000,
		token: "",
	},
	{
		name: "Pedro",
		cpf: "00000000001",
		agency: "105",
		number: 000001,
		password: "Pedro123",
		current_amount: 80000,
		credit: 10,
		token: "",
	}
]
accounts.each do |account|
  Account.create account
end
