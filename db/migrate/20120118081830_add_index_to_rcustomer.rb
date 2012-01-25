class AddIndexToRcustomer < ActiveRecord::Migration
  def change
    add_index :rcustomers, [:firstname, :lastname]
  end
end
