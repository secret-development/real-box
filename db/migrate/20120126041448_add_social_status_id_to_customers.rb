class AddSocialStatusIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :social_status_id, :integer
  end
end
