class AddSocialStatusToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :socialstatus, :string
  end
end
