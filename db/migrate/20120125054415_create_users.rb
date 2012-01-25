class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.date :birth_date
      t.string :adress
      t.string :phone

      t.timestamps
    end
  end
end
