class AddLastLogOutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_log_out_at, :datetime
  end
end
