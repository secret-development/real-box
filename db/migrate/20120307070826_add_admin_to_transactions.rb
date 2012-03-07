class AddAdminToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :admin, :boolean
  end
end
