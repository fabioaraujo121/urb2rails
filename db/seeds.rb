# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Fábio", email: "fabioaraujo121@gmail.com", password: "123456") if User.find_by_email("fabioaraujo121@gmail.com").nil?

Kind.where(name: "Obra", user_id: 1).first_or_create
KindStep.where(name: "Abertura", user_id: 1, kind_id: 1).first_or_create
KindStep.where(name: "Análise", user_id: 1, kind_id: 1).first_or_create
KindStep.where(name: "Exigência", valid_time: false, user_id: 1, kind_id: 1).first_or_create

Citizen.where(name: "Cidadão José", cpf: "11122233344", user_id: 1).first_or_create