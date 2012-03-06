class AddAdminToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :admin, :boolean

  end
end
