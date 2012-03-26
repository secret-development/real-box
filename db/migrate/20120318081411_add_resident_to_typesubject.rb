class AddResidentToTypesubject < ActiveRecord::Migration
  def change
    add_column :typesubjects, :resident, :boolean
  end
end