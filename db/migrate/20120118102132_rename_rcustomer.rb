class RenameRcustomer < ActiveRecord::Migration
  def change
    rename_table :rcustomers, :customers    
  end
end
