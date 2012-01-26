class CreateTypeCustomers < ActiveRecord::Migration
  def change
    create_table :type_customers do |t|
      t.string :title

      t.timestamps
    end
  end
end
