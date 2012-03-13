# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# type of transaction:


if RAILS_ENV == "production"
  # type transactions
  exists_typetr = Typetransaction.all
  if exists_typetr.size == 0
    types_of_transactions = ['Купля', 'Продажа', 'Аренда', 'Съем', 'Обмен']
    types_of_transactions.each do |t|
      Typetransaction.create(:name => t)
    end
  end
  
  # users
  users = User.all
  if users.size == 0
    User.create(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :role => true, :lastname => "Иванов", :firstname => "Иван")    
  end

elsif RAILS_ENV = "development"
  # type transactions
  types_of_transactions = ['Купля', 'Продажа', 'Аренда', 'Съем', 'Обмен']
  types_of_transactions.each do |t|
    Typetransaction.create(:name => t)
  end
  
  # users
  User.create(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :role => true, :lastname => "Иванов", :firstname => "Иван")
end