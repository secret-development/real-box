class AddCustomerIdToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :customer_id, :integer
  end
end