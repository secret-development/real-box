class AddPermalinkToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :permalink, :string
  end
end
