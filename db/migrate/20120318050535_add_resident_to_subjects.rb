class AddResidentToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :resident_id, :integer
  end
end
