# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# type of transaction:
Typetransaction.delete_all
types_of_transactions = ['Купля', 'Продажа', 'Аренда', 'Съем', 'Обмен']
types_of_transactions.each do |t|
  Typetransaction.create(:name => t)
end

#status of transaction:
Statustransaction.delete_all
statuses_of_transactions = ['Активна', 'Отложена', 'Завершена']
statuses_of_transactions.each do |s|
  Statustransaction.create(:name => s)
end

User.create(email: 'admin@example.com', password: 'password')

