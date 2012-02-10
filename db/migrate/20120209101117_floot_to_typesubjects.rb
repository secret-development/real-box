class FlootToTypesubjects < ActiveRecord::Migration
  def change
    add_column :typesubjects, :floor, :boolean
  end
end