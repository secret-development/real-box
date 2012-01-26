class AddTypeCustomerIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :type_customer_id, :integer
  end
end
