class AddUserLastnameToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_lastname, :string
  end
end
