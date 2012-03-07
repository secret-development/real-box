class AddStatusToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :active, :boolean, :default => true
  end
end