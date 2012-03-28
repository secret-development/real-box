class AddFiredToUser < ActiveRecord::Migration
  def change
    add_column :users, :fired, :boolean, :default => false
  end
end