class AddTypefieldToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :typefield, :string
  end
end