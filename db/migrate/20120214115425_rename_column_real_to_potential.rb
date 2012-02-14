class RenameColumnRealToPotential < ActiveRecord::Migration
  def change
    rename_column :customers, :real, :potentials
  end
end