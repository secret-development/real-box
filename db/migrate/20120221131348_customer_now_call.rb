class CustomerNowCall < ActiveRecord::Migration
  def change
    add_column :customers, :lastcall, :datetime
  end
end