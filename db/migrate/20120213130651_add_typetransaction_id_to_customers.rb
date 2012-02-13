class AddTypetransactionIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :typetransaction_id, :integer
  end
end