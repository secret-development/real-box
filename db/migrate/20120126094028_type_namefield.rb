class TypeNamefield < ActiveRecord::Migration
  def change
    add_column :condition_fields, :typefield, :string
  end
end