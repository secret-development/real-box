class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :typetransaction_id
      t.integer :statustransaction_id
      t.string :name
      t.text :description
      t.integer :price
      t.integer :customer_id
      t.integer :user_id
      t.boolean :payment

      t.timestamps
    end
  end
end
