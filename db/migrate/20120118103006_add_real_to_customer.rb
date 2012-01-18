class AddRealToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :real, :boolean
  end
end
